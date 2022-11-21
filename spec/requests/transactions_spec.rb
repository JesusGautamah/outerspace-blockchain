# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/transactions", type: :request do
  include Devise::Test::IntegrationHelpers
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:user) { create(:user) }
  let(:user_two) { create(:user, username: "user_two", email: "usertwo@email.com") }
  let(:wallet) { create(:wallet, user: user) }
  let(:wallet_two) { create(:wallet, user: user_two) }
  let(:valid_attributes) { { sender_key: wallet.pv_key, receiver_key: wallet_two.pr_key,
                             status: 0, data: "MyText", upl_file: "MyString",
                             upl_file_name: "MyString", upl_file_type: "MyString",
                             upl_file_size: "MyString", upl_file_hash: "MyString",
                             amount: 1.5, fee: 1.5, block_id: block.id } }
  let(:invalid_attributes) { { sender_key: wallet.pv_key, receiver_key: wallet_two.pr_key,
                               status: 0, data: "MyText", upl_file: "MyString",
                               upl_file_name: "MyString", upl_file_type: "MyString",
                               upl_file_size: "MyString", upl_file_hash: "MyString",
                               amount: 1.5, fee: 0.0, block_id: block.id } }
  describe "GET /index" do
    it "renders a successful response" do
      Transaction.create! valid_attributes
      get transactions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      transaction = Transaction.create! valid_attributes
      get transaction_url(transaction)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      chain
      block
      sign_in user
      get new_transaction_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "redirect to transactions if user authenticated" do
        sign_in user
        post transactions_url, params: { transaction: valid_attributes }
        expect(response).to redirect_to(transactions_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Transaction" do
        expect {
          post transactions_url, params: { transaction: invalid_attributes }
        }.to change(Transaction, :count).by(0)
      end
    end
  end
end
