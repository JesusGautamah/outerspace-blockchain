# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def create_first_chain
  Chain.create(
    name: ENV["FIRST_CHAIN_NAME"],
    maintainer: ENV["FIRST_CHAIN_MAINTAINER"],
    chain_version: "0.0.1",
    description: "This is a blockchain project generated with outerspace-blockchain."
  )
end

create_first_chain
