# frozen_string_literal: true

class Contract < ApplicationRecord
  validates :blk_transaction, presence: true
  validates :first_sig, length: { is: 64 }, uniqueness: true
  validates :second_sig, length: { is: 64 }, uniqueness: true
  validates :third_sig, length: { is: 64 }, uniqueness: true
  validates :fourth_sig, length: { is: 64 }, uniqueness: true
  belongs_to :blk_transaction, class_name: "Transaction", foreign_key: "transaction_id", inverse_of: :contract
end
