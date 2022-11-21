# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # POST /transactions or /transactions.json
  def create
    @receiver_key = transaction_params[:receiver_key]
    @amount = transaction_params[:amount]
    @sender_key = Wallet.find_by(user_id: current_user.id).pv_key
    create_transaction_in_block
    redirect_to transactions_path, notice: "Processing transaction, please wait a minute and refresh the page"
  end

  private
  def create_transaction_in_block
    block = Block.where(master_hash: nil).first
    work.perform_async(@receiver_key, @sender_key, @amount, block.id)
  end

  def work
    TransactionToBlockWorker
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:sender_key, :receiver_key, :signature_time, :status, :data, :upl_file, :upl_file_name, :upl_file_type, :upl_file_size, :upl_file_hash, :amount, :fee, :block_id)
  end
end
