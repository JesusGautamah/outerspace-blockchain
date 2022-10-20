class Chain < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :maintainer, presence: true, length: { maximum: 50 }
  validates :chain_version, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 1000 }

  has_many :blocks, dependent: :destroy
end
