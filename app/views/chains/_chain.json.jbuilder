json.extract! chain, :id, :name, :blocks_count, :maintainer, :chain_version, :description, :created_at, :updated_at
json.url chain_url(chain, format: :json)
