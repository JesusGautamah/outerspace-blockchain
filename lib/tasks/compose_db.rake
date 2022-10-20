# frozen_string_literal: true

require "rake"

namespace :compose_db do
  task :drop do
    puts "Dropping Database..."
    puts `sudo docker compose run --rm web rails db:drop`
    puts "Dropping Database... Done!"
  end

  task :rollback do
    puts "Rolling Back Database..."
    puts `sudo docker compose run --rm web rails db:rollback`
    puts "Rolling Back Database... Done!"
  end

  task :complete_setup do
    puts "Setting up Database..."
    puts `sudo docker compose run --rm web rails db:create`
    puts `sudo docker compose run --rm web rails db:migrate`
    puts `sudo docker compose run --rm web rails db:seed`
    puts "Setting up Database... Done!"
  end

  task :setup do
    puts "Setting up and seeding Database..."
    puts `sudo docker compose run --rm web rails db:setup`
    puts "Setting up and seeding Database... Done!"
  end

  task :create do
    puts "Creating Database..."
    puts `sudo docker compose run --rm web rails db:create`
    puts "Creating Database... Done!"
  end

  task :migrate do
    puts "Running Migration..."
    puts `sudo docker compose run --rm web rails db:migrate`
    puts "Running Migration... Done!"
  end

  task :seed do
    puts "Running Seed..."
    puts `sudo docker compose run --rm web rails db:seed`
    puts "Running Seed... Done!"
  end

  task :reset_setup do
    puts "Resettting Database..."
    puts `sudo docker compose run --rm web rails db:drop`
    puts `sudo docker compose run --rm web rails db:setup`
    puts "Resetting up Database... Done!"
  end

  task :reset do
    puts "Resetting Database..."
    puts `sudo docker compose run --rm web rails db:drop`
    puts `sudo docker compose run --rm web rails db:create`
    puts `sudo docker compose run --rm web rails db:migrate`
    puts `sudo docker compose run --rm web rails db:seed`
    puts "Resetting Compose... Done!"
  end
end
