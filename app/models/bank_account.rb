# frozen_string_literal: true

class BankAccount < ApplicationRecord
  validates :balance, numericality: { in: -2_000_000..2_000_000 }

  def self.total_amount
    Float(sum(:balance))
  end

  def self.transfer(sender_id, receiver_id, amount)
    TransferFunds.call(sender_id:, receiver_id:, amount:)
  end

  def self.deposit(account_id, amount)
    Deposit.call(account_id:, amount:)
  end

  def self.withdraw(account_id, amount)
    Withdraw.call(account_id:, amount:)
  end
end
