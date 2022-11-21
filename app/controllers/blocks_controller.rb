# frozen_string_literal: true

class BlocksController < ApplicationController
  before_action :set_block, only: %i[ show ]

  # GET /blocks or /blocks.json
  def index
    @blocks = Block.all
  end

  # GET /blocks/1 or /blocks/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_block
    @block = Block.find(params[:id])
  end
end
