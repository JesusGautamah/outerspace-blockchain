# frozen_string_literal: true

class AssignContractsService < ApplicationService
  def initialize(contract_ids, ticket_id)
    @contract_ids = contract_ids
    @ticket_id = ticket_id
  end

  def call
    assign_contract
  end

  private
    attr_reader :contract_ids, :ticket_id

    def ticket
      @ticket ||= Ticket.find_by(id: ticket_id)
    end

    def contracts
      @contracts ||= Contract.where(id: contract_ids)
    end

    def block
      @block ||= Block.where(master_hash: nil).last
    end

    def block_confirmed?
      block.nonce >= ENV["CONTRACTS_LIMIT"].to_i
    end

    def update_nonce
      block.update(nonce: block.nonce + 1)
    end

    def signatures_limit_reached?(contract)
      contract.signatures.count == ENV["SIGNATURES_LIMIT"].to_i
    end

    def create_block
      Block.create!(chain: Chain.first, previous_hash: block.master_hash,
                    master_hash: nil, nonce: 0, connections: 0, contracts_count: 0,
                    contracts_limit: ENV["CONTRACTS_LIMIT"].to_i, block_data: "block #{block.id + 1}")
    end

    def confirm_block
      return if confirmed_now == true
      @confirmed_now = true
      block.update(master_hash: generate_master_hash)
      block.reload
      @new_block = create_block
      pay_receivers
      pay_miners
    end

    def complete_contracts
      @complete_contracts ||= []
    end

    def uncomplete_contracts
      @uncomplete_contracts ||= []
    end

    def signatures
      @signatures ||= []
    end

    # block master hash is all unique contracts signatures hashed in SHA256
    def generate_master_hash
      Digest::SHA256.hexdigest(complete_contracts.map(&:signatures).flatten.map(&:signature).join)
    end

    def complete_contracts_limit_reached?
      complete_contracts.count == ENV["CONTRACTS_LIMIT"].to_i
    end

    def confirmed_now
      @confirmed_now ||= false
    end

    def pay_receivers
      block_transactions = block.transactions
      conts = block_transactions.map(&:contract)
      conts_to_destroy = []
      conts.each do |contract|
        if contract.signatures.count < ENV["SIGNATURES_LIMIT"].to_i
          transact = block_transactions.find_by(contract: contract)
          conts_to_destroy << contract.id
          transact.update(block: @new_block)
          Contract.create(blk_transaction: transact)
        end
        amount = contract.blk_transaction.amount.to_f - contract.blk_transaction.fee.to_f
        wallet = Wallet.find_by(pr_key: contract.blk_transaction.receiver_key)
        wallet.update(balance: wallet.balance + amount)
      end

      Contract.where(id: conts_to_destroy).destroy_all
    end

    def payed_miners
      @payed_miners ||= []
    end

    def pay_miners
      tickets = Ticket.where(pool_id: block.pool.id)
      total_signatures = tickets.map(&:signatures).map(&:count).sum
      counted_users = []
      amount_to_pay = []
      tickets.each do |ticket|
        signatures = ticket.signatures
        user = ticket.user
        unless counted_users.include?(user)
          counted_users << user
          amount_to_pay << signatures.count
        else
          amount_to_pay[counted_users.index(user)] += signatures.count
        end
      end
      amount_to_pay.each_with_index do |amount, index|
        next if payed_miners.include?(counted_users[index])
        wallet = counted_users[index].wallet
        wallet.update(balance: wallet.balance + (amount.to_f / total_signatures.to_f) * block.pool.amount)
        payed_miners << counted_users[index]
      end
    end

    def new_signature(contract)
      contract.update(signatures_count: contract.signatures_count + 1)
      Signature.new(contract_id: contract.id, signature: ticket.user_acceptable_hash, ticket_id: ticket.id, user_id: ticket.user_id)
    end

    def parse_in_arrays(contract)
      uncomplete_contracts << contract unless signatures_limit_reached?(contract)
      complete_contracts << contract if signatures_limit_reached?(contract)
    end

    def add_signature(contract)
      return if signatures_limit_reached?(contract) || confirmed_now == true || block_confirmed?
      signatures << new_signature(contract)
      contract.update(status: (contract.status + 1))
    end

    def block_actions(contract)
      update_nonce if signatures_limit_reached?(contract)
      confirm_block if complete_contracts_limit_reached? || block_confirmed?
    end

    def signatures_import(signatures)
      Signature.import signatures if signatures.present?
      ticket.update(status: :inactive)
    end

    def assign_contract
      contracts.each do |contract|
        parse_in_arrays(contract)
        add_signature(contract)
      end
      signatures_import(signatures)
      contracts.each do |contract|
        block_actions(contract)
      end
    end
end
