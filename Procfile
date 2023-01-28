web: bin/rails server
release: bin/rails db:migrate
release: bin/rails assets:precompile
sidekiq: bundle exec sidekiq -C config/sidekiq.yml
