# frozen_string_literal: true

require "rails_helper"

RSpec.describe PoolsController, type: :controller do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:pool) { create(:pool, block: block) }
  let(:user) { create(:user) }
  let(:user_two) { create(:user, email: 'lorem@ipsum.com', username: 'lorem', password: 'loremaludias', password_confirmation: 'loremaludias') }
  let(:wallet) { create(:wallet, user: user) }
  let(:wallet_two) { create(:wallet, user: user_two) }

  context "#index" do
    it "returns http success" do
      chain
      block
      sign_in user
      pool = Pool.find(3)
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:pools)).to eq([pool])
    end
  end
end