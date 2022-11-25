# frozen_string_literal: true

class Api::V1::BlockConfirmationsController < Api::V1::ApplicationController
  before_action :unauthorized?
  before_action :ticket_founded?, only: [:confirm_block]
  before_action :confirmation_hash_founded?, only: [:confirm_block]

  def confirm_block
    return not_valid_confirmation_hash_response unless hash_confirmed?
    assign_contract
  end

  def info_to_mine
    render json: { words: words, number_sequences: number_sequences, symbol_sequences: symbol_sequences }, status: :ok
  end

  private
    def hash_confirmed?
      @ticket.user_acceptable_hash == confirmation_hash
    end

    def assign_contract
      AssignContractWorker.perform_async(@ticket.id)
      render json: { message: "Contract assigned" }, status: :ok
    end

    def not_valid_confirmation_hash_response
      render json: { error: "Not valid confirmation hash" }, status: :not_found
    end

    def words
      @words = @user.acceptable_words
    end

    def number_sequences
      @number_sequences = @user.acceptable_number_sequences
    end

    def symbol_sequences
      @symbol_sequences = @user.acceptable_symbol_sequences
    end

    def block_confirmation_params
      params.permit(:user_confirmation_hash)
    end
end
