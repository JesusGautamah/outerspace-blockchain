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
