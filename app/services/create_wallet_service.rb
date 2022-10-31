# frozen_string_literal: true

class CreateWalletService
  def initialize(user_id)
    @user_id = user_id
  end


  def call
    create_wallet
  end

  private

    attr_reader :user_id

    def create_wallet
      Wallet.create(user_id: user_id)
    end
end
