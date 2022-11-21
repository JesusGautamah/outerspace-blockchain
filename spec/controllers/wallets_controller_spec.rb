# frozen_string_literal: true

require "rails_helper"

RSpec.describe WalletsController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:user) { create(:user) }

  describe "GET /index" do
    before(:each) do
      chain
      block
      sign_in user
    end

    it "renders a successful response" do
      sign_in user
      get :index
      expect(response).to be_successful
    end

    it "instantiates the user wallet" do
      sign_in user
      get :index
      expect(assigns(:wallet)).to eq(user.wallet)
    end
  end
end
