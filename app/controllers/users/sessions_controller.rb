# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  def create
    self.resource = warden.authenticate!(auth_options) do |user|
      if user.valid_password?(params[:user][:password])
        sign_in(resource_name, resource)
      else
        return login_failed
      end
    end
    login_pass
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def login_pass
    set_flash_message!(:notice, :signed_in)
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def login_failed
    redirect_to root_path, alert: "Login failed"
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
