# frozen_string_literal: true

class Api::V1::BlockConfirmationsController < ActionController::API
  def confirm_block
    return unauthorized_response unless find_user_by_header
    @ticket = Ticket.find_by(user_id: @user.id, status: :active)
    return ticket_not_found_response unless @ticket.present?
    confirmation_hash = block_confirmation_params[:user_confirmation_hash]
    return confirmation_hash_not_found_response unless confirmation_hash.present?
    return not_valid_confirmation_hash_response unless @ticket.user_acceptable_hash == confirmation_hash
    assign_contract
  end

  def transactions_to_mine
    return unauthorized_response unless find_user_by_header
    ticket = Ticket.find_by(user_id: @user.id)
    return ticket_not_found_response unless ticket.present?
    transactions_ids = ticket.transaction_id_list
    transactions = Transaction.where(id: transactions_ids)
    transactions_json = transactions.to_json
    render json: transactions_json, status: :ok
  end

  def info_to_mine
    return unauthorized_response unless find_user_by_header
    words = @user.acceptable_words
    number_sequences = @user.acceptable_number_sequences
    symbol_sequences = @user.acceptable_symbol_sequences
    render json: { words: words, number_sequences: number_sequences, symbol_sequences: symbol_sequences }, status: :ok
  end

  private
  def find_user_by_header
    return unless request.headers["X-Api-Key"].present?
    api_key = request.headers["X-Api-Key"]
    @user = User.find_by(api_key: api_key)
    return unless @user.present?
    @user.api_secret == request.headers["X-Api-Secret"]
  end

  def unauthorized_response
    render json: { error: "Unauthorized" }, status: :unauthorized
  end

  def ticket_not_found_response
    render json: { error: "Ticket not found" }, status: :not_found
  end

  def confirmation_hash_not_found_response
    render json: { error: "Confirmation hash not found" }, status: :not_found
  end

  def assign_contract
    AssignContractWorker.perform_async(@ticket.id)
    render json: { message: "Contract assigned" }, status: :ok
  end

  def not_valid_confirmation_hash_response
    render json: { error: "Not valid confirmation hash" }, status: :not_found
  end

  def block_confirmation_params
    params.permit(:user_confirmation_hash)
  end
end
