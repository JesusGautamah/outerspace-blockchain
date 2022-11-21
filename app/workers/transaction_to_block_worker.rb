# frozen_string_literal: true

class TransactionToBlockWorker < ApplicationWorker
  sidekiq_options retry: false

  def perform(receiver_key, sender_key, amount, block_id)
    @receiver_key = receiver_key
    @sender_key = sender_key
    @amount = amount
    @block_id = block_id
    transaction_accepted?
  end

  private
  attr_reader :receiver_key, :sender_key, :amount, :block_id

  def transaction_accepted?
    raise WalletNotFoundError unless wallets_present?
    raise BlockNotFoundError unless block_exists?
    raise AmountNotEnoughError unless amount_check
    subtract_amount
    if add_trasaction_to_block
      @success = true
    end
  end

  def fee
    (amount.to_f * 0.10).round(2)
  end

  def subtract_amount
    @sender_wallet.balance -= amount.to_f + fee
    @sender_wallet.save
  end

  def wallets_present?
    wallet_exists?("pr_key", receiver_key) && wallet_exists?("pv_key", sender_key)
  end

  def amount_check
    @sender_wallet = Wallet.find_by(pv_key: sender_key)
    @sender_wallet.balance >= amount.to_f + fee
  end

  def add_trasaction_to_block
    TransactionToBlockService.new(receiver_key, sender_key, amount, block_id).call
  end
end
