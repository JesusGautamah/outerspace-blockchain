# frozen_string_literal: true

class CreateWalletService < ApplicationService
  def initialize(user_id)
    @user_id = user_id
  end


  def call
    return if wallet_exists?("user_id", user_id)
    create_wallet
  end

  private
  attr_reader :user_id

  def create_wallet
    Wallet.create(user_id: user_id) ? true : false
  end
end
