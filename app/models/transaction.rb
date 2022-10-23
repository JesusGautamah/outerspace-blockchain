class Transaction < ApplicationRecord
  validates :sender_key, presence: true
  validates :receiver_key, presence: true
  validates :fee, presence: true, numericality: { greater_than: 0 }
  validates :amount, presence: true
end
