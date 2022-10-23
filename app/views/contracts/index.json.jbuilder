# frozen_string_literal: true

json.array! @contracts, partial: "contracts/contract", as: :contract
