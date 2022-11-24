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
end
