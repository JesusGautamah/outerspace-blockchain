# frozen_string_literal: true

namespace :api do
  namespace :v1 do
    post "confirm_block", to: "block_confirmations#confirm_block"
    post "open_ticket", to: "ticket_manager#open_ticket"
    get "info_to_mine", to: "block_confirmations#info_to_mine"
    get "tr_to_mine", to: "ticket_manager#transactions_to_mine"
    get "ticket_keys", to: "ticket_manager#retrieve_ticket_keys"
  end
end
