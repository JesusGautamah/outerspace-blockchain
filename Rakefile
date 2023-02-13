require "bundler"
Bundler::GemHelper.install_tasks name: "outerspace-blockchain"

require_relative "config/application"

Rails.application.load_tasks


# Import tasks from lucy_dockerunner local gem, registered in gemfile with path

require "lucy_dockerunner"

LucyDockerunner.load_tasks