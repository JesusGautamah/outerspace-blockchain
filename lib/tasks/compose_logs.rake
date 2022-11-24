# frozen_string_literal: true

require "rake"
require_relative "task_helpers/compose_taskhelper"


def task_helper
  @task_helper ||= TaskHelpers::ComposeTaskhelper.new
end

def compose_command
  @compose_comand ||= task_helper.compose_command
end

namespace :compose_logs do
  task :web do
    puts "Showing Web Logs..."
    system "sudo #{compose_command} logs web"
    puts "Showing Web Logs... Done!"
  end

  task :db do
    puts "Showing Database Logs..."
    system "sudo #{compose_command} logs db"
    puts "Showing Database Logs... Done!"
  end

  task :redis do
    puts "Showing Redis Logs..."
    system "sudo #{compose_command} logs redis"
    puts "Showing Redis Logs... Done!"
  end

  task :sidekiq do
    puts "Showing Sidekiq Logs..."
    system "sudo #{compose_command} logs sidekiq"
    puts "Showing Sidekiq Logs... Done!"
  end

  task :all do
    puts "Showing All Logs..."
    system "sudo #{compose_command} logs"
    puts "Showing All Logs... Done!"
  end

  task :tail_web do
    puts "Tailing Web Logs..."
    system "sudo #{compose_command} logs -f web"
    puts "Tailing Web Logs... Done!"
  end

  task :tail_db do
    puts "Tailing Database Logs..."
    system "sudo #{compose_command} logs -f db"
    puts "Tailing Database Logs... Done!"
  end

  task :tail_redis do
    puts "Tailing Redis Logs..."
    system "sudo #{compose_command} logs -f redis"
    puts "Tailing Redis Logs... Done!"
  end

  task :tail_sidekiq do
    puts "Tailing Sidekiq Logs..."
    system "sudo #{compose_command} logs -f sidekiq"
    puts "Tailing Sidekiq Logs... Done!"
  end

  task :tail_all do
    puts "Tailing All Logs..."
    system "sudo #{compose_command} logs -f"
    puts "Tailing All Logs... Done!"
  end

  task :follow_web do
    puts "Following Web Logs..."
    system "sudo #{compose_command} logs -f web"
    puts "Following Web Logs... Done!"
  end

  task :follow_db do
    puts "Following Database Logs..."
    system "sudo #{compose_command} logs -f db"
    puts "Following Database Logs... Done!"
  end

  task :follow_redis do
    puts "Following Redis Logs..."
    system "sudo #{compose_command} logs -f redis"
    puts "Following Redis Logs... Done!"
  end

  task :follow_sidekiq do
    puts "Following Sidekiq Logs..."
    system "sudo #{compose_command} logs -f sidekiq"
    puts "Following Sidekiq Logs... Done!"
  end

  task :follow_all do
    puts "Following All Logs..."
    system "sudo #{compose_command} logs -f"
    puts "Following All Logs... Done!"
  end
end
