# frozen_string_literal: true

class Deposit < TransactionBase
  before do
    check_amount
    context.account = find_account(context.account_id)
  end

  def call
    context.account.with_lock do
      context.account.balance += op_sign * context.amount
      context.account.save!
    end
  rescue ActiveRecord::RecordInvalid => e
    context.fail!(error: e.message)
  end

  private

  def op_sign
    1
  end
end
