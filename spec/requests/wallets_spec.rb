# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/wallets", type: :request do
  let(:user) { create(:user) }
  let(:valid_attributes) do
    { user_id: user.id, pr_key: "MyString", pv_key: "MyString", balance: 0.0, status: :active }
  end
  let(:invalid_attributes) do
    { user_id: user.id, pr_key: "MyString", pv_key: "MyString", balance: 1.5, status: :inactive }
  end

  describe "GET /index" do
    it "renders a successful response" do
      Wallet.create! valid_attributes
      get wallets_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      wallet = Wallet.create! valid_attributes
      get wallet_url(wallet)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_wallet_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      wallet = Wallet.create! valid_attributes
      get edit_wallet_url(wallet)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Wallet" do
        expect {
          post wallets_url, params: { wallet: valid_attributes }
        }.to change(Wallet, :count).by(1)
      end

      it "redirects to the created wallet" do
        post wallets_url, params: { wallet: valid_attributes }
        expect(response).to redirect_to(wallet_url(Wallet.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Wallet" do
        expect {
          post wallets_url, params: { wallet: invalid_attributes }
        }.to change(Wallet, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post wallets_url, params: { wallet: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { user_id: user.id, pr_key: "MyString", pv_key: "MyString", balance: 0.0, status: :active }
      }

      it "updates the requested wallet" do
        wallet = Wallet.create! valid_attributes
        patch wallet_url(wallet), params: { wallet: new_attributes }
        wallet.reload
      end

      it "redirects to the wallet" do
        wallet = Wallet.create! valid_attributes
        patch wallet_url(wallet), params: { wallet: new_attributes }
        wallet.reload
        expect(response).to redirect_to(wallet_url(wallet))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        wallet = Wallet.create! valid_attributes
        patch wallet_url(wallet), params: { wallet: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested wallet" do
      wallet = Wallet.create! valid_attributes
      expect {
        delete wallet_url(wallet)
      }.to change(Wallet, :count).by(-1)
    end

    it "redirects to the wallets list" do
      wallet = Wallet.create! valid_attributes
      delete wallet_url(wallet)
      expect(response).to redirect_to(wallets_url)
    end
  end
end
