# frozen_string_literal: true

json.extract! contract, :id, :first_sig, :second_sig, :third_sig, :fourth_sig, :status, :transact_id, :created_at, :updated_at
json.url contract_url(contract, format: :json)
