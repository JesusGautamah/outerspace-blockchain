# frozen_string_literal: true

class ChainsController < ApplicationController
  before_action :set_chain, only: %i[ show edit update destroy ]

  # GET /chains or /chains.json
  def index
    @chains = Chain.all
  end

  # GET /chains/1 or /chains/1.json
  def show
  end

  # GET /chains/new
  def new
    @chain = Chain.new
  end

  # GET /chains/1/edit
  def edit
  end

  # POST /chains or /chains.json
  def create
    @chain = Chain.new(chain_params)

    respond_to do |format|
      if @chain.save
        format.html { redirect_to chain_url(@chain), notice: "Chain was successfully created." }
        format.json { render :show, status: :created, location: @chain }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chains/1 or /chains/1.json
  def update
    respond_to do |format|
      if @chain.update(chain_params)
        format.html { redirect_to chain_url(@chain), notice: "Chain was successfully updated." }
        format.json { render :show, status: :ok, location: @chain }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chains/1 or /chains/1.json
  def destroy
    @chain.destroy

    respond_to do |format|
      format.html { redirect_to chains_url, notice: "Chain was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_chain
    @chain = Chain.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def chain_params
    params.require(:chain).permit(:name, :blocks_count, :maintainer, :chain_version, :description)
  end
end
