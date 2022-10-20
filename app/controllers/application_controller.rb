# frozen_string_literal: true

# This class is Application Controller and his methods is available for all controllers
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home; end

  #  before_action :configure_permitted_parameters, if: :devise_controller?
  #  protected
  #  def configure_permitted_parameters
  #    devise_parameter_sanitizer.permit(:sign_up)
  #  end
end
