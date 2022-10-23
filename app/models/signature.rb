# frozen_string_literal: true

class Signature < ApplicationRecord
  belongs_to :contract
  validates :signature, presence: true, length: { is: 64 }, uniqueness: true
  validates :common_word, presence: true
  validates :symbol_sequence, presence: true
  validates :number_sequence, presence: true
  validates_with SequencesValidator
end
