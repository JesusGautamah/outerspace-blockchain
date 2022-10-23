# frozen_string_literal: true

class SignaturesController < ApplicationController
  before_action :set_signature, only: %i[ show edit update destroy ]

  # GET /signatures or /signatures.json
  def index
    @signatures = Signature.all
  end

  # GET /signatures/1 or /signatures/1.json
  def show
  end

  # GET /signatures/new
  def new
    @signature = Signature.new
  end

  # GET /signatures/1/edit
  def edit
  end

  # POST /signatures or /signatures.json
  def create
    @signature = Signature.new(signature_params)

    respond_to do |format|
      if @signature.save
        format.html { redirect_to signature_url(@signature), notice: "Signature was successfully created." }
        format.json { render :show, status: :created, location: @signature }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @signature.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signature
      @signature = Signature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def signature_params
      params.require(:signature).permit(:signature, :time_ref, :contract_id, :common_word, :symbol_sequence, :number_sequence, :verify_sig, :block_hash, :signature_hash)
    end
end
