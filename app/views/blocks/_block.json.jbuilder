json.extract! block, :id, :nonce, :previous_hash, :block_data, :connections, :created_at, :updated_at
json.url block_url(block, format: :json)
