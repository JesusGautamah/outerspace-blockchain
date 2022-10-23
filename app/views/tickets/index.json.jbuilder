# frozen_string_literal: true

json.array! @tickets, partial: "tickets/ticket", as: :ticket
