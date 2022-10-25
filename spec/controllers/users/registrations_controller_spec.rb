# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::RegistrationsController, type: :controller do
  # after sign up it has toredirect to root path

  describe "POST #create" do
    it "redirects to root path" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      post :create, params: { user: attributes_for(:user) }
      expect(response).to redirect_to root_path
    end
  end
end
