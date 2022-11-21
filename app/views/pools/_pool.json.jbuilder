# frozen_string_literal: true

json.extract! pool, :id, :block_id, :users_count, :signatures_count, :amount, :stage, :created_at, :updated_at
json.url pool_url(pool, format: :json)
