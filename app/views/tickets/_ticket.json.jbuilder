# frozen_string_literal: true

json.extract! ticket, :id, :user_id, :pool_id, :status, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
