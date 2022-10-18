# frozen_string_literal: true

require_relative "lib/osbc/osbc"

Gem::Specification.new do |spec|
  spec.name = "osbc"
  spec.version = Osbc::VERSION
  spec.authors = ["jesus_gautamah"]
  spec.email = ["lima.jesuscc@gmail.com"]

  spec.summary = "Blockchain implementation in Ruby"
  spec.description = "Blockchain implementation in Ruby using Rails and Docker"
  spec.homepage = "https://outerspace-blockchain.herokuapp.com/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.3"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/outerspace-coding/outerspace-blockchain"
  spec.metadata["changelog_uri"] = "https://github.com/outerspace-coding/outerspace-blockchain/blob/main/CHANGELOG.md"
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "bundler", "~> 2.2"
  spec.add_runtime_dependency "rails", "~> 7.0.4"
  spec.add_runtime_dependency "pg", "~> 1.4"
  spec.add_runtime_dependency "puma", "~> 5.0"
  spec.add_runtime_dependency "importmap-rails", "~> 1.1"
  spec.add_runtime_dependency "tailwindcss-rails", "~> 2.0"
  spec.add_runtime_dependency "rubocop-rails", "~> 2.16"
  spec.add_runtime_dependency "rubocop-rspec", "~> 2.13"
  spec.add_runtime_dependency "sidekiq", "~> 6.5"
  spec.add_runtime_dependency "devise", "~> 4.8"
  spec.add_runtime_dependency "rspec-rails", "~> 6.0"
  spec.add_runtime_dependency "factory_bot_rails", "~> 6.2"
  spec.add_runtime_dependency "faker", "~> 2.23"
  spec.add_runtime_dependency "simplecov", "~> 0.21"
  spec.add_runtime_dependency "selenium-webdriver", "~> 4.5"
  spec.add_runtime_dependency "sprockets-rails", "~> 3.4"
  spec.add_runtime_dependency "webdrivers", "~> 5.2"
  spec.add_runtime_dependency "turbo-rails", "~> 1.3"
  spec.add_runtime_dependency "stimulus-rails", "~> 1.1"
  spec.add_runtime_dependency "jbuilder", "~> 2.11"

end