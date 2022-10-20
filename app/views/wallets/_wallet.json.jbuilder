json.extract! wallet, :id, :user_id, :pr_key, :pv_key, :balance, :status, :created_at, :updated_at
json.url wallet_url(wallet, format: :json)
