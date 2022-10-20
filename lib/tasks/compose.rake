# frozen_string_literal: true

require "rake"

namespace :compose do
  task :install do
    puts "Installing Compose..."
    puts `sudo docker compose build`
    puts `sudo docker compose run web rails db:create`
    puts `sudo docker compose run web rails db:migrate`
    puts `sudo docker compose run web rails db:seed`
    puts `sudo docker compose down`
    puts "Installing Compose... Done!"
  end

  task :up do
    puts "Running Compose..."
    puts `sudo docker compose up -d --remove-orphans`
    puts "Running Compose... Done!"
  end

  task :down do
    puts "Stopping Compose..."
    `sudo docker compose down`
    puts "Stopping Compose... Done!"
  end

  task :db_detach do
    puts "Running Database Detached..."
    puts `sudo docker compose up -d db`
    puts "Running Database Detached... Done!"
  end

  task :redis_detach do
    puts "Running Redis Detached..."
    puts `sudo docker compose up -d redis`
    puts "Running Redis Detached... Done!"
  end

  task :back_detach do
    puts "Running Backend Detached..."
    puts `sudo docker compose up -d --remove-orphans db redis sidekiq`
    puts "Running Backend Detached... Done!"
  end

  task :test do
    puts "Running Test..."
    puts `sudo docker compose run web bundle exec rspec`
    puts "Running Test... Done!"
  end

  task :restart do
    puts "Restarting Compose..."
    puts `sudo docker compose down`
    puts `sudo docker compose up -d --remove-orphans`
    puts "Restarting Compose... Done!"
  end

  task :clean_ports do
    puts "Cleaning Ports..."
    puts `sudo docker compose down`
    puts `sudo docker compose rm -v`
    puts `sudo docker rm -f $(sudo docker ps -a -q)`
    puts "Cleaning Ports... Done!"
  end
end
