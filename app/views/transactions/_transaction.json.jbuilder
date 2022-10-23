json.extract! transaction, :id, :sender_key, :receiver_key, :signature_time, :confirmed, :master, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
