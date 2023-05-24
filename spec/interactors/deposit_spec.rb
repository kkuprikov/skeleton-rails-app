# frozen_string_literal: true

require 'rails_helper'

describe Deposit do
  subject(:context) { described_class.call(account_id: account.id, amount:) }

  let(:amount)  { 10                    }
  let(:account) { create(:bank_account) }

  it_behaves_like 'transaction with invalid amount'
  it_behaves_like 'transaction with invalid account'

  specify do
    expect(context).to be_a_success
    expect(context.account.balance).to eq 787
  end
end
