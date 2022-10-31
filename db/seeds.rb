# frozen_string_literal: true

def create_first_chain
  Chain.create(
    name: ENV["FIRST_CHAIN_NAME"],
    maintainer: ENV["FIRST_CHAIN_MAINTAINER"],
    chain_version: "0.0.1",
    description: "This is a blockchain project generated with outerspace-blockchain."
  )

  puts "Chain created"
  puts "Chain name: #{ENV["FIRST_CHAIN_NAME"]}"
  puts "Chain maintainer: #{ENV["FIRST_CHAIN_MAINTAINER"]}"
end

def create_acceptable_word_lists
  create_acceptable_words
  create_acceptable_symbol_sequences
  create_acceptable_number_sequences
end

def create_acceptable_words
  word_list = %w[the of and to a in
                 is you that it he
                 was for on are as
                 with his they I at
                 be this have from or
                 one had by word but
                 not what all were we
                 when your can said there
                 use an each which she do
                 how their if will up other
                 about out many then them
                 these so some her would
                 make like him into time
                 as look two more write
                 go see number no way could
                 people my than first water
                 been call who oil its now
                 find long down day did get
                 come made may part]
  word_list.each do |word|
    AcceptableWord.find_or_create_by(word: word)
  end
end

def create_acceptable_symbol_sequences
  symbol_sequence_list = %w[!!! !@# !@#$ !@#$% !@#$%^ !@#$%^& !@#$%^&* !@#$%^&*(
                            !@#$%^&*( )@#$%^&*( )@#$%^&*() @#$%^&*() @#$%^&*()_
                            @#$%^&*()_ @#$%^&*()_+ #$%^&*()_+ #$%^&*()_+{
                            #$%^&*()_+{ #$%^&*()_+{ }%^&*()_+{ }%^&*()_+{]
  symbol_sequence_list.each do |symbol_sequence|
    AcceptableSymbolSequence.find_or_create_by(seq: symbol_sequence)
  end
end

def create_acceptable_number_sequences
  number_sequence_list = (0..9999).map { |n| format("%04d", n) }

  number_sequence_list.each do |number_sequence|
    AcceptableNumberSequence.find_or_create_by(seq: number_sequence)
  end
end


def create_first_block
  Block.create(
    chain: Chain.first,
    previous_hash: "0000000000000000000000000000000000000000000000000000000000000000",
    block_data: "This is the first block of the blockchain.",
    nonce: 0,
    connections: 0,
    contracts_count: 0,
    contracts_limit: ENV["FIRST_CHAIN_CONTRACTS_LIMIT"].to_i,
    # timestamp: Time.now
  )

  puts "First block created"
end

create_first_chain
create_acceptable_word_lists
create_first_block
