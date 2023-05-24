# frozen_string_literal: true

class TransferFunds < TransactionBase
  before do
    check_amount
    context.sender = find_account(context.sender_id)
    context.receiver = find_account(context.receiver_id)
  end

  def call
    BankAccount.transaction do
      context.sender.lock!
      context.receiver.lock!
      context.sender.update!(balance: context.sender.balance - context.amount)
      context.receiver.update!(balance: context.receiver.balance + context.amount)
    end
  rescue ActiveRecord::RecordInvalid => e
    context.fail!(error: e.message)
  end
end
