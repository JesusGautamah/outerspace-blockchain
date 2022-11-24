# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # POST /tickets or /tickets.json
  def create
    return no_transactions_response if block_transactions.empty?
    create_ticket
    redirect_to tickets_path, notice: "Processing ticket, please wait, wait a minute and refresh the page"
  end

  private
    def create_ticket
      CreateTicketWorker.perform_async(current_user.id, current_pool.id, time_ref)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def time_ref
      @time_ref = block_transactions.first.created_at
    end

    def no_transactions_response
      redirect_to root_path, notice: "No transactions yet"
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:user_id, :pool_id, :status, :time_ref)
    end
end
