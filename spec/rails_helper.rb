# frozen_string_literal: true

require "simplecov"
SimpleCov.start "rails" do
  add_group "Services", "app/services"
  add_group "Workers", "app/workers"
  add_group "OSBC", "lib/osbc"
  add_group "Outerspace", "lib/outerspace"
  add_group "Task Helpers", "lib/tasks/task_helpers"
  add_filter "app/channels"
  add_filter "app/jobs"
end

require "faker"
require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"

abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"

Dir[Rails.root.join("spec", "support", "**", "*.rb")].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
