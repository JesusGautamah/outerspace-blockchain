# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssignContractWorker, type: :worker do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:pool) { create(:pool, block: block) }
  let(:user) { create(:user) }
  let(:user_two) { create(:user, email: 'lorem@ipsum.com', username: 'lorem', password: 'loremaludias', password_confirmation: 'loremaludias') }
  let(:wallet) { create(:wallet, user: user) }
  let(:wallet_two) { create(:wallet, user: user_two) }
  let(:transaction) { create(:transaction, sender_key: wallet.pv_key, receiver_key: wallet_two.pr_key, amount: 100 , fee: 10, block: block) }
  let(:transaction_two) { create(:transaction, sender_key: wallet.pv_key, receiver_key: wallet_two.pr_key, amount: 100 , fee: 10, block: block) }
  let(:contract) { create(:contract, blk_transaction: transaction) }
  let(:contract_two) { create(:contract, blk_transaction: transaction_two) }
  let(:word) { create(:acceptable_word) }
  let(:number_sequence) { create(:acceptable_number_sequence) }
  let(:symbol_sequence) { create(:acceptable_symbol_sequence) }
  let(:ticket) { create(:ticket, pool: pool, user: user, transaction_id_list: [transaction.id, transaction_two.id]) }

  before(:each) do
    chain
    block
    pool
    word
    number_sequence
    symbol_sequence
    wallet.update!(balance: 1000)
    transaction
    transaction_two
    contract
    contract_two
    ticket
  end

  it 'should confirm all contracts' do
    expect(contract.confirmed).to eq(false)
    expect(contract_two.confirmed).to eq(false)

    5.times do
      AssignContractWorker.new.perform(ticket.id)
    end
    expect(contract.reload.signatures_count).to eq(5)
    expect(contract.reload.confirmed).to eq(true)
    expect(contract_two.reload.confirmed).to eq(true)
  end
end
