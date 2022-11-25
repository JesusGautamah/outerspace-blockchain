# frozen_string_literal: true

class Api::V1::TicketManagerController < Api::V1::ApplicationController
  before_action :unauthorized?
  before_action :block_transactions_empty?, only: [:open_ticket]

  def open_ticket
    return ticket_already_opened_response unless ticket_nil?
    return ticket_already_opened_response if ticket_active?
    return terms_not_confirmed_response unless ticket_params_confirmed?
    create_ticket if acceptable_create?
    ticket_opened_response
  end


  private
    def ticket_nil?
      ticket.nil?
    end

    def ticket_active?
      return false if ticket_nil?
      ticket.status == "active"
    end

    def acceptable_create?
      ticket_nil? && ticket_params_confirmed? || ticket_params_confirmed? && ticket_active? == false
    end

    def ticket_params_confirmed?
      open_ticket_params[:ticket_terms] == "confirmed"
    end

    def ticket_already_opened_response
      render json: { error: "Ticket already opened" }, status: :not_found
    end

    def ticket_opened_response
      render json: { message: "Ticket opened" }, status: :ok
    end

    def terms_not_confirmed_response
      render json: { error: "Ticket terms not confirmed" }, status: :not_found
    end

    def open_ticket_params
      params.permit(:ticket_terms)
    end

    def time_ref
      @time_ref = block_transactions.first.created_at.to_s
    end

    def user_id
      @user_id = user.id.to_s
    end

    def current_pool_id
      @current_pool_id = current_pool.id.to_s
    end

    def create_ticket
      CreateTicketWorker.perform_async(user_id, current_pool_id, time_ref)
    end
end
