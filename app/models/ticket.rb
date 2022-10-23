# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :pool
  validates :time_ref, presence: true
  validates :status, presence: true
end
