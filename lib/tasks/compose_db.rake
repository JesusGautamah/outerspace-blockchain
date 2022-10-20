# frozen_string_literal: true

require "rake"

namespace :compose_db do
  task :drop do
    puts "Dropping Database..."
    puts `sudo docker compose run web rails db:drop`
    puts "Dropping Database... Done!"
  end

  task :create do
    puts "Creating Database..."
    puts `sudo docker compose run web rails db:create`
    puts "Creating Database... Done!"
  end

  task :migrate do
    puts "Running Migration..."
    puts `sudo docker compose run web rails db:migrate`
    puts "Running Migration... Done!"
  end

  task :seed do
    puts "Running Seed..."
    puts `sudo docker compose run web rails db:seed`
    puts "Running Seed... Done!"
  end

  task :reset do
    puts "Resetting Compose..."
    puts `sudo docker compose run web rails db:drop`
    puts `sudo docker compose run web rails db:create`
    puts `sudo docker compose run web rails db:migrate`
    puts `sudo docker compose run web rails db:seed`
    puts "Resetting Compose... Done!"
  end
end
