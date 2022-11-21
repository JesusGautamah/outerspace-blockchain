# frozen_string_literal: true

require "rake"

namespace :compose_db do
  task :drop do
    puts "Dropping Database..."
    system("sudo docker compose run --rm web rake db:drop")
    puts "Dropping Database... Done!"
  end

  task :rollback do
    puts "Rolling Back Database..."
    system("sudo docker compose run --rm web rails db:rollback")
    puts "Rolling Back Database... Done!"
  end

  task :complete_setup do
    puts "Setting up Database..."
    system("sudo docker compose run --rm web rake db:create")
    system("sudo docker compose run --rm web rake db:migrate")
    system("sudo docker compose run --rm web rake db:seed")
    puts "Setting up Database... Done!"
  end

  task :setup do
    puts "Setting up and seeding Database..."
    system("sudo docker compose run --rm web rake db:setup")
    puts "Setting up and seeding Database... Done!"
  end

  task :create do
    puts "Creating Database..."
    system("sudo docker compose run --rm web rake db:create")
    puts "Creating Database... Done!"
  end

  task :migrate do
    puts "Running Migration..."
    system("sudo docker compose run --rm web rake db:migrate")
    puts "Running Migration... Done!"
  end

  task :seed do
    puts "Running Seed..."
    system("sudo docker compose run --rm web rake db:seed")
    puts "Running Seed... Done!"
  end

  task :reset_setup do
    puts "Resettting Database..."
    system("sudo docker compose run --rm web rake db:drop")
    system("sudo docker compose run --rm web rake db:setup")
    puts "Resetting up Database... Done!"
  end

  task :reset do
    puts "Resetting Database..."
    system("sudo docker compose run --rm web rake db:drop")
    system("sudo docker compose run --rm web rake db:create")
    system("sudo docker compose run --rm web rake db:migrate")
    system("sudo docker compose run --rm web rake db:seed")
    puts "Resetting Compose... Done!"
  end

  task :force_reset do
    puts "Running Compose Down"
    system("rake compose:down")
    system("rake compose_db:reset")
  end
end
