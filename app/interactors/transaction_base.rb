# frozen_string_literal: true

class TransactionBase
  include Interactor

  protected

  def check_amount
    context.fail!(error: 'Amount must be positive') unless context.amount.positive?
  end

  def find_account(id)
    BankAccount.find(id)
  rescue ActiveRecord::RecordNotFound => e
    context.fail!(error: e.message)
  end
end
