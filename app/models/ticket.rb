# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :pool
  validates :first_five, presence: true
  validates :last_five, presence: true
  validates :time_ref, presence: true
  validates :status, presence: true
  has_many :signatures

  enum status: { active: 0, inactive: 1 }
end
