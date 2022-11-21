# frozen_string_literal: true


class CreateWalletWorker < ApplicationWorker
  sidekiq_options retry: false

  def perform(user_id)
    @user_id = user_id
    raise UserNotFindError unless user_exists?
    if create_wallet
      @success = true
    end
  end

  private
    attr_reader :user_id

    def create_wallet
      CreateWalletService.new(user_id).call
    end
end
