# frozen_string_literal: true

class Wallet < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :pr_key, presence: false
  validates :pv_key, presence: false
  # validates :balance, presence: true, numericality: { equal_to: 0.0 }, on: :create
  validates :status, presence: true, inclusion: %w(active inactive)

  before_create :create_keys


  enum status: { active: 0, inactive: 1 }

  def create_keys(pv_random = nil, pr_random = nil)
    if pv_random.nil? && pr_random.nil?
      pv_random = SecureRandom.hex(64)
      pr_random = SecureRandom.hex(64)
    end

    dig_pv = Digest::SHA256.hexdigest(pv_random)
    dig_pr = Digest::SHA256.hexdigest(pr_random)

    if Wallet.exists?(pr_key: dig_pr) || Wallet.exists?(pv_key: dig_pv)
      raise "Key already exists"
    else
      self.pr_key = dig_pr
      self.pv_key = dig_pv
    end
  end
end
