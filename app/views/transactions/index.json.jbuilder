# frozen_string_literal: true

json.array! @transactions, partial: "transactions/transaction", as: :transaction
