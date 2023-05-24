# frozen_string_literal: true

require 'rails_helper'

describe TransferFunds do
  subject(:context) { described_class.call(sender_id: sender.id, receiver_id: receiver.id, amount:) }

  let(:amount)   { 10                      }
  let(:sender)   { create(:bank_account)   }
  let(:receiver) { create(:bank_account)   }

  it_behaves_like 'transaction with invalid amount'

  specify do
    expect(context).to be_a_success
    expect(context.sender.balance).to eq 767
    expect(context.receiver.balance).to eq 787
  end

  specify do
    receiver.update!(balance: 2_000_000)
    sender_balance = sender.balance
    expect(context).not_to be_a_success
    expect(sender.reload.balance).to eq(sender_balance)
  end
end
