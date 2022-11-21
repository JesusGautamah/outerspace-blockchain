# frozen_string_literal: true

class Block < ApplicationRecord
  belongs_to :chain
  validates :nonce, presence: true
  validates :previous_hash, presence: true
  validates :block_data, presence: true
  validates :connections, presence: true
  has_many :transactions, dependent: :destroy, counter_cache: true
  after_create :create_pool
  has_one :pool, dependent: :destroy, inverse_of: :block

  private
  def create_pool
    Pool.create(block_id: self.id)
  end
end
