# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::RegistrationsController, type: :controller do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }

  describe "POST #create" do
    it "redirects to root path" do
      chain
      block
      @request.env["devise.mapping"] = Devise.mappings[:user]
      post :create, params: { user: attributes_for(:user) }
      expect(response).to redirect_to root_path
    end
  end
end
