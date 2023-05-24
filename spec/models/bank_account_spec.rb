# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BankAccount do
  it 'calculates balance sum' do
    create(:bank_account)
    create(:bank_account)
    expect(described_class.total_amount).to eq(1554)
  end

  it 'is not valid if balance is out of bounds' do
    expect(build(:bank_account, balance: 2_000_001)).not_to be_valid
    expect(build(:bank_account, balance: -2_000_001)).not_to be_valid
  end
end
