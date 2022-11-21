# frozen_string_literal: true

class CreateTicketService < ApplicationService
  def initialize(user_id, pool_id, time_ref)
    @user_id = user_id
    @pool_id = pool_id
    @time_ref = time_ref
  end

  def call
    return false if ticket_exists?
    return false unless user_exists?
    if ticket_created?
      update_block_connections
      true
    else
      false
    end
  end

  private
    attr_reader :user_id, :pool_id, :time_ref

    def block
      @block ||= Block.where(master_hash: nil).last
    end

    def transactions
      @transactions ||= block.transactions.where(created_at: time_ref..Time.now)
    end

    def user
      @user ||= User.find(user_id)
    end

    def word
      @word ||= user.acceptable_words.sample
    end

    def number_sequence
      @number_sequence ||= user.acceptable_number_sequences.sample
    end

    def symbol_sequence
      @symbol_sequence ||= user.acceptable_symbol_sequences.sample
    end

    def generate_transaction_id_list
      transactions.map(&:id)
    end

    def shuffled_string
      puts "Word: #{word}"
      puts "Number sequence: #{number_sequence}"
      puts "Symbol sequence: #{symbol_sequence}"
      (word + number_sequence + symbol_sequence).split("").shuffle.join
    end

    def generate_user_acceptable_hash
      puts "Shuffled string: #{shuffled_string}"
      hash = Digest::SHA256.hexdigest(shuffled_string)
      block_hash = Digest::SHA256.hexdigest(@transactions.to_json)
      master_hash = Digest::SHA256.hexdigest(hash + block_hash)
      [hash, block_hash, master_hash]
    end

    def update_block_connections
      block.update(connections: (block.connections + 1))
    end

    def ticket_created?
      hash, block_hash, master_hash = generate_user_acceptable_hash
      @ticket = Ticket.new(user_id: user_id, status: :active, pool_id: pool_id,
                           time_ref: time_ref, user_acceptable_hash: hash,
                           confirmation_hash: master_hash, block_hash: block_hash,
                           transaction_id_list: generate_transaction_id_list)
      @ticket.save ? true : false
    end

    def ticket_exists?
      Ticket.find_by(user_id: user_id, pool_id: pool_id, status: :active).present?
    end
end
