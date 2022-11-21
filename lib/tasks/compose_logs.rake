# frozen_string_literal: true

require "rake"

namespace :compose_logs do
  task :web do
    puts "Showing Web Logs..."
    system "sudo docker compose logs web"
    puts "Showing Web Logs... Done!"
  end

  task :db do
    puts "Showing Database Logs..."
    system "sudo docker compose logs db"
    puts "Showing Database Logs... Done!"
  end

  task :redis do
    puts "Showing Redis Logs..."
    system "sudo docker compose logs redis"
    puts "Showing Redis Logs... Done!"
  end

  task :sidekiq do
    puts "Showing Sidekiq Logs..."
    system "sudo docker compose logs sidekiq"
    puts "Showing Sidekiq Logs... Done!"
  end

  task :all do
    puts "Showing All Logs..."
    system "sudo docker compose logs"
    puts "Showing All Logs... Done!"
  end

  task :tail_web do
    puts "Tailing Web Logs..."
    system "sudo docker compose logs -f web"
    puts "Tailing Web Logs... Done!"
  end

  task :tail_db do
    puts "Tailing Database Logs..."
    system "sudo docker compose logs -f db"
    puts "Tailing Database Logs... Done!"
  end

  task :tail_redis do
    puts "Tailing Redis Logs..."
    system "sudo docker compose logs -f redis"
    puts "Tailing Redis Logs... Done!"
  end

  task :tail_sidekiq do
    puts "Tailing Sidekiq Logs..."
    system "sudo docker compose logs -f sidekiq"
    puts "Tailing Sidekiq Logs... Done!"
  end

  task :tail_all do
    puts "Tailing All Logs..."
    system "sudo docker compose logs -f"
    puts "Tailing All Logs... Done!"
  end

  task :follow_web do
    puts "Following Web Logs..."
    system "sudo docker compose logs -f web"
    puts "Following Web Logs... Done!"
  end

  task :follow_db do
    puts "Following Database Logs..."
    system "sudo docker compose logs -f db"
    puts "Following Database Logs... Done!"
  end

  task :follow_redis do
    puts "Following Redis Logs..."
    system "sudo docker compose logs -f redis"
    puts "Following Redis Logs... Done!"
  end

  task :follow_sidekiq do
    puts "Following Sidekiq Logs..."
    system "sudo docker compose logs -f sidekiq"
    puts "Following Sidekiq Logs... Done!"
  end

  task :follow_all do
    puts "Following All Logs..."
    system "sudo docker compose logs -f"
    puts "Following All Logs... Done!"
  end
end
