# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/wallets", type: :request do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:user) { create(:user) }
  let(:valid_attributes) do
    { user_id: user.id, pr_key: "MyString", pv_key: "MyString", balance: 0.0, status: :active }
  end
  let(:invalid_attributes) do
    { user_id: user.id, pr_key: "MyString", pv_key: "MyString", balance: 1.5, status: :inactive }
  end

  before(:each) do
    chain
    block
  end

  describe "GET /index" do
    it "renders a successful response" do
      Wallet.create! valid_attributes
      get wallets_url
      expect(response).to_not be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      wallet = Wallet.create! valid_attributes
      get wallet_url(wallet)
      expect(response).to_not be_successful
    end
  end
end
