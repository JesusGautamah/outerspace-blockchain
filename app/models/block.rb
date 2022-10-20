class Block < ApplicationRecord
  belongs_to :chain
  validates :nonce, presence: true
  validates :previous_hash, presence: true
  validates :block_data, presence: true
  validates :connections, presence: true
end
