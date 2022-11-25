# frozen_string_literal: true

class Api::V1::ApplicationController < ActionController::API
  def unauthorized?
    return unauthorized_response unless find_user_by_header
  end

  def ticket_founded?
    @ticket = Ticket.find_by(user_id: @user.id, status: :active)
    return ticket_not_found_response unless @ticket.present?
  end

  private
    def find_user_by_header
      return unless request.headers["X-API-KEY"].present?
      api_key = request.headers["X-API-KEY"]
      @user = User.find_by(api_key: api_key)
      return unless @user.present?
      @user.api_secret == request.headers["X-API-SECRET"]
    end

    def confirmation_hash_founded?
      return confirmation_hash_not_found_response unless confirmation_hash.present?
    end

    def confirmation_hash
      @confirmation_hash ||= block_confirmation_params[:user_confirmation_hash]
    end

    def confirmation_hash_not_found_response
      render json: { error: "Confirmation hash not found" }, status: :not_found
    end

    def ticket_not_found_response
      render json: { error: "Ticket not found" }, status: :not_found
    end

    def unauthorized_response
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
end
