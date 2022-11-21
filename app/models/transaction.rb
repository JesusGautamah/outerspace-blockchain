# frozen_string_literal: true

class Transaction < ApplicationRecord
  include ActiveModel::Validations
  validates :sender_key, presence: true
  validates :receiver_key, presence: true
  validates :fee, presence: true, numericality: { greater_than: 0 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates_with WalletExistsValidator
  belongs_to :block
  has_one :contract, dependent: :destroy, inverse_of: :blk_transaction
  after_create :create_contract

  def sender
    Wallet.find_by(pv_key: sender_key).user.username
  end

  def receiver
    Wallet.find_by(pr_key: receiver_key).user.username
  end

  def create_contract
    Contract.create(blk_transaction: self)
  end
end
