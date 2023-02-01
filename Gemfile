source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails", "~> 3.4"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.6"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails", "~> 1.1"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails", "~> 1.3"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails", "~> 1.1"

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "tailwindcss-rails", "~> 2.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder", "~> 2.11"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", "~> 1.13", require: false

# Rubocop Rails
gem "rubocop-rails", "~> 2.16", require: false

# Rubocop Rspec
gem "rubocop-rspec", "~> 2.13", require: false

# sidekiq
gem "sidekiq", "~> 6.5"

# Slim template
gem "slim-rails", "~> 3.5"

# Devise
gem "devise", "~> 4.8"

# Rails Controller Testing
gem "rails-controller-testing", "~> 1.0"

# Active Record Import
gem "activerecord-import"

# Google Firestore
gem "google-cloud-firestore", "~> 2.6"

# Rack Cors
gem "rack-cors"


# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", "~> 1.6", platforms: %i[ mri mingw x64_mingw ]
  # Rspec for testing
  gem "rspec-rails", "~> 6.0"
  # FactoryBot for testing
  gem "factory_bot_rails", "~> 6.2"
  # Faker for testing
  gem "faker", "~> 2.23"
  # SimpleCov for testing
  gem "simplecov", "~> 0.21"
  # Shoulda Matchers for testing
  gem "shoulda-matchers", "~> 5.0"
  # Database Cleaner for testing
  gem "database_cleaner-active_record", "~> 2.0"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console", "~> 4.2"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara", "~> 3.37"
  gem "selenium-webdriver", "~> 4.5"
  gem "webdrivers", "~> 5.2"
end
