# frozen_string_literal: true

require "rake"

namespace :compose do
  task :install do
    puts "Installing Compose..."
    puts `sudo docker-compose build`
    puts `sudo docker-compose run web rails db:create`
    puts `sudo docker-compose run web rails db:migrate`
    puts `sudo docker-compose run web rails db:seed`
    puts "Installing Compose... Done!"
  end

  task :reset do
    puts "Resetting Compose..."
    puts `sudo docker-compose run web rails db:drop`
    puts `sudo docker-compose run web rails db:create`
    puts `sudo docker-compose run web rails db:migrate`
    puts `sudo docker-compose run web rails db:seed`
    puts `sudo docker-compose build`
    puts "Resetting Compose... Done!"
  end

  task :up do
    puts "Running Compose..."
    puts `sudo docker-compose up -d --remove-orphans`
    puts "Running Compose... Done!"
  end

  task :down do
    puts "Stopping Compose..."
    `sudo docker-compose down`
    puts "Stopping Compose... Done!"
  end

  task :migration do
    puts "Running Migration..."
    puts `sudo docker-compose run web rails db:migrate`
    puts "Running Migration... Done!"
  end

  task :seed do
    puts "Running Seed..."
    puts `sudo docker-compose run web rails db:seed`
    puts "Running Seed... Done!"
  end

  task :test do
    puts "Running Test..."
    puts `sudo docker-compose run web bundle exec rspec`
    puts "Running Test... Done!"
  end

  task :restart do
    puts "Restarting Compose..."
    puts `sudo docker-compose down`
    puts `sudo docker-compose up`
    puts "Restarting Compose... Done!"
  end
end
