# frozen_string_literal: true

class Contract < ApplicationRecord
  validates :blk_transaction, presence: true
  belongs_to :blk_transaction, class_name: "Transaction", foreign_key: "transaction_id", inverse_of: :contract
  has_many :signatures, inverse_of: :contract, dependent: :destroy

  def confirmed
    signatures_count == ENV["SIGNATURES_LIMIT"].to_i
  end
end
