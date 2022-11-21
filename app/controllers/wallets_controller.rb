# frozen_string_literal: true

class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @wallets = current_user.wallet
  end

  def show
  end

  private
    def set_wallet
      @wallet = Wallet.find(params[:id])
    end
end
