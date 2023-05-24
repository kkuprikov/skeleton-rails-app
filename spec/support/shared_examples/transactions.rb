# frozen_string_literal: true

RSpec.shared_examples 'transaction with invalid amount' do
  let(:amount) { -10 }
  specify do
    expect(context).to be_a_failure
    expect(context.error).to eq('Amount must be positive')
  end
end

RSpec.shared_examples 'transaction with invalid account' do
  let(:account) { build(:bank_account) }
  specify do
    expect(context).to be_a_failure
    expect(context.error).to match(/Couldn't find BankAccount/)
  end
end
