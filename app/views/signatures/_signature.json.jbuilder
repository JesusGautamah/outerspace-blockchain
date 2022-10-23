# frozen_string_literal: true

json.extract! signature, :id, :signature, :time_ref, :contract_id, :common_word, :symbol_sequence, :number_sequence, :verify_sig, :block_hash, :signature_hash, :created_at, :updated_at
json.url signature_url(signature, format: :json)
