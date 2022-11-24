# frozen_string_literal: true

require "rails_helper"

describe Api::V1::BlockConfirmationsController, type: :request do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:sender_user) { create(:user) }
  let(:receiver_user) { create(:user, email: "receiver@mail.com", username: "receiver") }
  let(:miner_user) { create(:user, email: "miner@mail.com", username: "miner") }
  let(:miner_wallet) { create(:wallet, user: miner_user) }
  let(:sender_wallet) { create(:wallet, user: sender_user) }
  let(:receiver_wallet) { create(:wallet, user: receiver_user) }
  let(:transaction) { create(:transaction, sender_key: sender_wallet.pv_key, receiver_key: receiver_wallet.pr_key, block: block) }
  let(:s_transaction) { create(:transaction, sender_key: sender_wallet.pv_key, receiver_key: sender_wallet.pr_key, block: block) }

  describe "POST /api/v1/confirm_block" do
    context "When user is not founded by X-API-KEY and X-API-SECRET" do
      it "returns unauthorized" do
        post "/api/v1/confirm_block", params: { user_acceptable_hash: "not provided 4 this test" }, headers: { "X-API-KEY": "invalid", "X-API-SECRET": "invalid" }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "When user is founded by X-API-KEY and X-API-SECRET" do
      it "returns ticket not found" do
        post "/api/v1/confirm_block", params: { user_acceptable_hash: "not provided" }, headers: { "X-API-KEY": sender_user.api_key, "X-API-SECRET": sender_user.api_secret }
        expect(response.body).to eq({ error: "Ticket not found" }.to_json)
        expect(response).to have_http_status(:not_found)
      end
    end

    context "When user is founded by X-API-KEY and X-API-SECRET and ticket is founded" do
      it "returns confirmation hash not found when invalid param name" do
        create(:ticket, pool: block.pool, user: miner_user, user_acceptable_hash: "a" * 64)
        post "/api/v1/confirm_block", params: { user_acceptable_hash: "not provided" }, headers: { "X-API-KEY": miner_user.api_key, "X-API-SECRET": miner_user.api_secret }
        expect(response.body).to eq({ error: "Confirmation hash not found" }.to_json)
        expect(response).to have_http_status(:not_found)
      end

      it "returns confirmation hash not found when invalid param value name" do
        create(:ticket, pool: block.pool, user: miner_user, user_acceptable_hash: "a" * 62)
        post "/api/v1/confirm_block", params: { user_confirmation_hash: "a" * 64 }, headers: { "X-API-KEY": miner_user.api_key, "X-API-SECRET": miner_user.api_secret }
        expect(response.body).to eq({ error: "Not valid confirmation hash" }.to_json)
        expect(response).to have_http_status(:not_found)
      end
    end

    context "When user is founded by X-API-KEY and X-API-SECRET and ticket is founded and confirmation hash is valid" do
      it "returns contract assigned" do
        create(:ticket, pool: block.pool, user: miner_user, user_acceptable_hash: "a" * 64)
        post "/api/v1/confirm_block", params: { user_confirmation_hash: "a" * 64 }, headers: { "X-API-KEY": miner_user.api_key, "X-API-SECRET": miner_user.api_secret }
        expect(response.body).to eq({ message: "Contract assigned" }.to_json)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET /apu/v1/info_to_mine" do
    context "it return unauthorized if user not founded by X-API-KEY and X-API-SECRET" do
      it "returns unauthorized" do
        get "/api/v1/info_to_mine", headers: { "X-API-KEY": "invalid" }
        expect(response).to have_http_status(:unauthorized)
      end

      it "returns unauthorized if user is founded but secret invalid" do
        get "/api/v1/info_to_mine", headers: { "X-API-KEY": sender_user.api_key, "X-API-SECRET": "invalid" }
        expect(response).to have_http_status(:unauthorized)
      end

      it "returns { words , number_sequences, symbol_sequences } if user is founded and secret valid" do
        get "/api/v1/info_to_mine", headers: { "X-API-KEY": sender_user.api_key, "X-API-SECRET": sender_user.api_secret }
        expect(response.body).to eq({ words: sender_user.acceptable_words,
                                      number_sequences: sender_user.acceptable_number_sequences,
                                      symbol_sequences: sender_user.acceptable_symbol_sequences }.to_json)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
