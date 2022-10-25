# frozen_string_literal: true

# This class is Application Controller and his methods is available for all controllers
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
    @blocks = blocks
    @contracts = contracts
  end

  private
    def blocks
      @blocks ||= Block.where.not(master_hash: nil).order(created_at: :desc).limit(5)
    end

    def contracts
      @contracts ||= Contract.last(5)
    end


  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up)
    end
end
