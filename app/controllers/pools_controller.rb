# frozen_string_literal: true

class PoolsController < ApplicationController
  before_action :set_pool, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /pools or /pools.json
  def index
    @pools = Pool.all
  end

  # GET /pools/1 or /pools/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool
      @pool = Pool.find(params[:id])
    end
end
