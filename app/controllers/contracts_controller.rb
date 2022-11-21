# frozen_string_literal: true

class ContractsController < ApplicationController
  before_action :set_contract, only: %i[ show edit update destroy ]

  # GET /contracts or /contracts.json
  def index
    @contracts = Contract.all
  end

  # GET /contracts/1 or /contracts/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contract
    @contract = Contract.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contract_params
    params.require(:contract).permit(:first_sig, :second_sig, :third_sig, :fourth_sig, :status, :transaction_id)
  end
end
