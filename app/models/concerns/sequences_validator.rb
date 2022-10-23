# frozen_string_literal: true

class SequencesValidator < ActiveModel::Validator
  def validate(record)
    @record = record
    @word = record.common_word
    @symbol_seq = record.symbol_sequence
    @number_seq = record.number_sequence
    record.errors.add(:base, "Invalid Hashable Content") unless valid_checker
  end

  private
    attr_reader :record, :word, :symbol_seq, :number_seq

    def valid_checker
      acceptable_word? && acceptable_symbol_sequence? && acceptable_number_sequence?
    end

    def acceptable_word?
      AcceptableWord.find_by(word: word).present?
    end

    def acceptable_symbol_sequence?
      AcceptableSymbolSequence.find_by(seq: symbol_seq).present?
    end

    def acceptable_number_sequence?
      AcceptableNumberSequence.find_by(seq: number_seq).present?
    end
end
