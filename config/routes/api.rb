# frozen_string_literal: true

namespace :api do
  namespace :v1 do
    post "confirm_block", to: "block_confirmations#confirm_block"
    get "tr_to_mine", to: "block_confirmations#transactions_to_mine"
    get "info_to_mine", to: "block_confirmations#info_to_mine"
  end
end
