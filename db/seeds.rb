# frozen_string_literal: true

def seed_exec
  create_first_chain
  create_acceptable_word_lists
  create_first_block
end

def dev_seed_exec
  puts "Seeding development database"
  puts "Creating first chain"
  create_first_chain
  puts "Creating acceptable word lists"
  create_acceptable_word_lists
  puts "Creating first block"
  create_first_block
  puts "Creating test users"
  create_test_users
end

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
  words = []
  word_list.each do |word|
    words << AcceptableWord.new(word: word) # rubocop:disable Lint/UselessAssignment
  end

  AcceptableWord.import words
end

def create_acceptable_symbol_sequences
  symbol_sequence_list = %w[!!! !@# !@#$ !@#$% !@#$%^ !@#$%^& !@#$%^&* !@#$%^&*(
                            !@#$%^&*( )@#$%^&*( )@#$%^&*() @#$%^&*() @#$%^&*()_
                            @#$%^&*()_ @#$%^&*()_+ #$%^&*()_+ #$%^&*()_+{
                            #$%^&*()_+{ #$%^&*()_+{ }%^&*()_+{ }%^&*()_+{
                            @#¨$@¨$$¨@(#$ @#¨$@¨$$¨@(#$ @#¨$@¨$$¨ @(#$¨@#¨$@¨$$¨@(#$)
                            $#$¨@*#$¨$(@#) $@$(*#&$) $@#$&)@#$() @&(*@#&$$]
  symbols = []
  symbol_sequence_list.each do |symbol_sequence|
    symbols << AcceptableSymbolSequence.new(seq: symbol_sequence) # rubocop:disable Lint/UselessAssignment
  end

  AcceptableSymbolSequence.import symbols
end

def create_acceptable_number_sequences
  number_sequence_list = (0..9999).map { |n| format("%04d", n) }

  numbers = []
  number_sequence_list.each do |number_sequence|
    numbers << AcceptableNumberSequence.new(seq: number_sequence) # rubocop:disable Lint/UselessAssignment
  end

  AcceptableNumberSequence.import numbers
end


def create_first_block
  Block.create(
    chain: Chain.first,
    previous_hash: "0000000000000000000000000000000000000000000000000000000000000000",
    block_data: "This is the first block of the blockchain.",
    nonce: 0,
    connections: 0,
    contracts_count: 0,
    contracts_limit: ENV["CONTRACTS_LIMIT"].to_i,
    # timestamp: Time.now
  )

  puts "First block created"
end

def create_test_users
  if User.find_by(email: "lorem@ipsum.com", username: "lorem")
    puts "Test user already exists"
  else
    User.create(
      email: "lorem@ipsum.com", username: "lorem", password: "password", password_confirmation: "password"
    )
    puts "Test user created"
  end

  if User.find_by(email: "lorem_sec@ipsum.com", username: "lorem_sec")
    puts "Test user already exists"
  else
    User.create(
      email: "lorem_sec@ipsum.com", username: "lorem_sec", password: "password", password_confirmation: "password"
    )
    puts "Test user created"
  end
end

if Rails.env.development?
  dev_seed_exec
else
  seed_exec
end
