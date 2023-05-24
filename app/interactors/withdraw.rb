# frozen_string_literal: true

class Withdraw < Deposit
  before do
    check_amount
    context.account = find_account(context.account_id)
  end

  private

  def op_sign
    -1
  end
end
