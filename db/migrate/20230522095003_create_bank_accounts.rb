# frozen_string_literal: true

class CreateBankAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts, id: :uuid do |t|
      t.decimal :balance, precision: 9, scale: 2

      t.timestamps
    end
  end
end
