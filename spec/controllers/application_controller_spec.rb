# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let (:user) { create(:user) }
  describe "GET #home" do
    it "returns http success" do
      chain
      block
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #mining_profile" do
    it "returns http success" do
      chain
      block
      sign_in user
      get :mining_profile
      expect(response).to have_http_status(:success)
    end
  end
end
