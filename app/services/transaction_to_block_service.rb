# frozen_string_literal: true

class TransactionToBlockService < ApplicationService
  def initialize(receiver_key, sender_key, amount, block_id)
    @receiver_key = receiver_key
    @sender_key = sender_key
    @amount = amount
    @block_id = block_id
  end

  def call
    create_transaction_to_block
  end

  private
    attr_reader :receiver_key, :sender_key, :amount, :block_id

    def create_transaction_to_block
      return false unless wallets_present?
      unless block_confirmed?
        transaction.block_id = block.id
        pool.amount += transaction.fee
        pool.save
        transaction_saved?
      else
        refresh_block
        create_transaction_to_block
      end
    end

    def block
      @block ||= Block.find(block_id)
    end

    def pool
      block.pool
    end

    def fee
      (amount.to_f * 0.10).round(2)
    end

    def transaction
      @transaction ||= Transaction.new(receiver_key: receiver_key, sender_key: sender_key, amount: amount, block_id: block.id, fee: fee)
    end

    def block_confirmed?
      block.master_hash.present?
    end

    def transaction_saved?
      transaction.save ? true : false
    end

    def wallets_present?
      wallet_exists?("pr_key", receiver_key) && wallet_exists?("pv_key", sender_key)
    end

    def refresh_block
      @block = Block.where(master_hash: nil).last
    end
end
