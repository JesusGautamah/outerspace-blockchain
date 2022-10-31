# frozen_string_literal: true


class CreateWalletWorker
  include Sidekiq::Worker

  def perform(user_id)
    @user_id = user_id
    create_wallet
  end

  private
    attr_reader :user_id

    def create_wallet
      CreateWalletService.new(user_id).call
    end
end
