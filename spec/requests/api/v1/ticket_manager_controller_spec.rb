# frozen_string_literal: true

require "rails_helper"

describe Api::V1::TicketManagerController, type: :request do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:sender_user) { create(:user) }
  let(:receiver_user) { create(:user, email: "receiver@mail.com", username: "receiver") }
  let(:miner_user) { create(:user, email: "miner@email.com", username: "miner") }
  let(:miner_wallet) { create(:wallet, user: miner_user) }
  let(:sender_wallet) { create(:wallet, user: sender_user, pr_key: "123454321", pv_key: "123454321") }
  let(:receiver_wallet) { create(:wallet, user: receiver_user, pr_key: "123454321", pv_key: "123454321") }

  describe "POST /api/v1/open_ticket" do
    before(:each) do
      chain
      block
      miner_wallet.update(balance: 1000)
      sender_wallet.update(balance: 1000)
      receiver_wallet.update(balance: 1000)
    end

    context "when the request is valid" do
      it "creates a ticket" do
        5.times do
          create(:transaction, sender_key: sender_wallet.pv_key, receiver_key: receiver_wallet.pr_key, amount: 100, block: block)
        end
        create(:ticket, user: miner_user, pool: block.pool, status: "inactive", user_acceptable_hash: "a" * 64)
        headers = { "X-API-KEY": miner_user.api_key, "X-API-SECRET": miner_user.api_secret }
        post "/api/v1/open_ticket", params: { ticket_terms: "confirmed" }, headers: headers
        expect(response.body).to eq({ message: "Ticket opened" }.to_json)
        expect(response).to have_http_status(200)
      end
    end

    context "when the ticket active already" do
      it "returns a ticket already opened response" do
        5.times do
          create(:transaction, sender_key: sender_wallet.pv_key, receiver_key: receiver_wallet.pr_key, amount: 100, block: block)
        end
        create(:ticket, user: miner_user, pool: block.pool, status: "active", user_acceptable_hash: "a" * 64)
        headers = { "X-API-KEY": miner_user.api_key, "X-API-SECRET": miner_user.api_secret }
        post "/api/v1/open_ticket", params: { ticket_terms: "confirmed" }, headers: headers
        expect(response.body).to eq({ error: "Ticket already opened" }.to_json)
        expect(response).to have_http_status(404)
      end
    end

    context "when the request is invalid" do
      it "returns status code 422" do
        5.times do
          create(:transaction, sender_key: sender_wallet.pv_key, receiver_key: receiver_wallet.pr_key, amount: 100, block: block)
        end
        headers = { "X-API-KEY": miner_user.api_key, "X-API-SECRET": miner_user.api_secret }
        post "/api/v1/open_ticket", params: { ticket_terms: "not confirmed" }, headers: headers
        expect(response.body).to eq({ error: "Ticket terms not confirmed" }.to_json)
        expect(response).to have_http_status(404)
      end
    end

    context "when has no transactions in the block" do
      it "returns status code 422" do
        headers = { "X-API-KEY": miner_user.api_key, "X-API-SECRET": miner_user.api_secret }
        post "/api/v1/open_ticket", params: { ticket_terms: "confirmed" }, headers: headers
        expect(response.body).to eq({ error: "No transactions in the block" }.to_json)
        expect(response).to have_http_status(404)
      end
    end

    context "ticket active check" do
      it "receives ticket_active? method" do
        expect(subject.send(:ticket_active?)).to eq(false)
      end
    end
  end
end
