# frozen_string_literal: true

# This class is Application Controller and his methods is available for all controllers
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:mining_profile]
  before_action :set_contracts, :set_blocks, :set_current_block, :set_current_pool, :set_block_transactions


  def home
    @contracts = contracts
  end

  def mining_profile
    @words = current_user.acceptable_words
    @numbers = current_user.acceptable_number_sequences
    @symbols = current_user.acceptable_symbol_sequences
    @ticket = current_user.tickets.where(status: :active).last
  end

  def terms; end


  def privacy_policy; end

  private
    def blocks
      @blocks = Block.all.order(created_at: :desc).limit(5)
    end

    def contracts
      @contracts = Contract.last(5)
    end

    def current_block
      @current_block = Block.find_by(master_hash: nil)
    end

    def current_pool
      @current_pool = Pool.find_by(block_id: current_block.id)
    end

    def block_transactions
      @block_transactions = Transaction.where(block_id: current_block.id)
    end

    def set_contracts
      contracts
    end

    def set_blocks
      blocks
    end

    def set_current_block
      current_block
    end

    def set_current_pool
      current_pool
    end

    def set_block_transactions
      block_transactions
    end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up)
    end
end
