# frozen_string_literal: true

require "rails_helper"

describe AssignContractsService, type: :service do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:sender) { create(:user) }
  let(:receiver) { create(:user, email: "rec@iver.com", username: "receiver") }
  let(:sender_wallet) { create(:wallet, user: sender) }
  let(:receiver_wallet) { create(:wallet, user: receiver, pr_key: "receiver_pr_key", pv_key: "receiver_pv_key") }
  let(:miner) { create(:user, email: "min@er.com", username: "miner") }
  let(:miner_wallet) { create(:wallet, user: miner) }

  before(:each) do
    sender_wallet.update!(balance: 1000)
    receiver_wallet.update!(balance: 10)
    miner_wallet.update!(balance: 50)
    create(:acceptable_word)
    create(:acceptable_symbol_sequence)
    create(:acceptable_number_sequence)
  end

  describe "assign contracts" do
    it "should assign contracts" do
      5.times do
        create(:transaction, block: block, sender_key: sender.wallet.pv_key, receiver_key: receiver.wallet.pr_key, amount: 100, fee: 10)
      end

      tick = create(:ticket, pool: block.pool, user: miner, user_acceptable_hash: "a" * 64)
      contracts = Contract.where("created_at >= ? AND created_at <= ?", block.transactions.first.created_at, tick.created_at)
      contracts_ids = contracts.pluck(:id)

      AssignContractsService.new(contracts_ids, tick.id).call

      contracts.each do |contract|
        expect(contract.signatures.count).to eq(1)
      end

      expect(block.nonce).to eq(0)
    end

    it "should confirm block if the contracts limit with signatures limit is reached" do
      5.times do
        create(:transaction, block: block, sender_key: sender.wallet.pv_key, receiver_key: receiver.wallet.pr_key, amount: 100, fee: 10)
      end

      block.pool.update!(amount: 50)

      5.times do
        tick = create(:ticket, pool: block.pool, user: miner, user_acceptable_hash: "a" * 64)
        contracts = Contract.where("created_at >= ? AND created_at <= ?", block.transactions.first.created_at, tick.created_at)
        contracts_ids = contracts.pluck(:id)
        AssignContractsService.new(contracts_ids, tick.id).call
      end

      tick = Ticket.last
      contracts = Contract.where("created_at >= ? AND created_at <= ?", block.transactions.first.created_at, tick.created_at)

      contracts.each do |contract|
        expect(contract.signatures.count).to eq(ENV["SIGNATURES_LIMIT"].to_i)
      end

      miner_wallet.reload
      expect(miner_wallet.balance.to_f).to eq(100.0)

      receiver_wallet.reload
      expect(receiver_wallet.balance.to_f).to eq(460.0)

      block.reload
      expect(block.nonce).to eq(5)

      expect(Block.count).to eq(2)
    end

    it "should not assign contracts if the contracts limit is reached" do
      5.times do
        create(:transaction, block: block, sender_key: sender.wallet.pv_key, receiver_key: receiver.wallet.pr_key, amount: 100, fee: 10)
      end

      block.pool.update!(amount: 50)

      5.times do
        tick = create(:ticket, pool: block.pool, user: miner, user_acceptable_hash: "a" * 64)
        2.times do
          create(:transaction, block: block, sender_key: sender.wallet.pv_key, receiver_key: receiver.wallet.pr_key, amount: 100, fee: 10)
        end
        contracts = Contract.where("created_at >= ? AND created_at <= ?", block.transactions.first.created_at, tick.created_at)
        contracts_ids = contracts.pluck(:id)
        AssignContractsService.new(contracts_ids, tick.id).call
      end

      tickets = Ticket.where(pool: block.pool)

      tickets.each do |ticket|
        contracts = Contract.where("created_at >= ? AND created_at <= ?", block.transactions.first.created_at, ticket.created_at)
        contracts.each do |contract|
          expect(contract.signatures.count).to eq(ENV["SIGNATURES_LIMIT"].to_i)
        end
      end

      last_block = Block.last
      transactions = last_block.transactions
      expect(transactions.count).to eq(10)
      expect(transactions.first.contract.present?).to eq(true)
      expect(transactions.second.contract.signatures.count).to eq(0)
    end
  end
end
