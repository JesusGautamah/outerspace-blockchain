# frozen_string_literal: true

namespace :api do
  namespace :v1 do
    post "confirm_block", to: "block_confirmations#confirm_block"
    post "open_ticket", to: "ticket_manager#open_ticket"
    get "info_to_mine", to: "block_confirmations#info_to_mine"
  end
end
