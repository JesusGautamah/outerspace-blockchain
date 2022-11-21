# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :create_wallet
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :wallet
  has_many :tickets
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :username, presence: true, uniqueness: true
  before_create :save_acceptable_assets
  before_create :save_api_keys
  has_many :signatures

  private
    def create_wallet
      CreateWalletWorker.perform_async(self.id)
    end

    def save_acceptable_assets
      words = AcceptableWord.all.sample(4)
      number_sequences = AcceptableNumberSequence.all.sample(4)
      symbol_sequences = AcceptableSymbolSequence.all.sample(4)

      words_to_save = words.map { |word| word.word }

      number_sequences_to_save = number_sequences.map { |number_sequence| number_sequence.seq }

      symbol_sequences_to_save = symbol_sequences.map { |symbol_sequence| symbol_sequence.seq }

      self.acceptable_words = words_to_save
      self.acceptable_number_sequences = number_sequences_to_save
      self.acceptable_symbol_sequences = symbol_sequences_to_save
    end

    def save_api_keys
      self.api_key = SecureRandom.hex(32)
      self.api_secret = SecureRandom.hex(32)
    end
end
