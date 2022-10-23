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

  # GET /contracts/new
  def new
    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts or /contracts.json
  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to contract_url(@contract), notice: "Contract was successfully created." }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1 or /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to contract_url(@contract), notice: "Contract was successfully updated." }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1 or /contracts/1.json
  def destroy
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to contracts_url, notice: "Contract was successfully destroyed." }
      format.json { head :no_content }
    end
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
