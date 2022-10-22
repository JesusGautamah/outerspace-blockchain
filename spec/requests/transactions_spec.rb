# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/transactions", type: :request do
  let(:valid_attributes) { { sender_key: "MyString", receiver_key: "MyString",
                             signature_time: "2022-10-22 19:10:59",
                             status: 0, data: "MyText", upl_file: "MyString",
                             upl_file_name: "MyString", upl_file_type: "MyString",
                             upl_file_size: "MyString", upl_file_hash: "MyString",
                             amount: 1.5, fee: 1.5 } }
  let(:invalid_attributes) { { sender_key: "MyString", receiver_key: "MyString",
                               signature_time: "2022-10-22 19:10:59",
                               status: 0, data: "MyText", upl_file: "MyString",
                               upl_file_name: "MyString", upl_file_type: "MyString",
                               upl_file_size: "MyString", upl_file_hash: "MyString",
                               amount: 1.5, fee: 0.0 } }
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
      get new_transaction_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Transaction" do
        expect {
          post transactions_url, params: { transaction: valid_attributes }
        }.to change(Transaction, :count).by(1)
      end

      it "redirects to the created transaction" do
        post transactions_url, params: { transaction: valid_attributes }
        expect(response).to redirect_to(transaction_url(id: Transaction.last.id))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Transaction" do
        expect {
          post transactions_url, params: { transaction: invalid_attributes }
        }.to change(Transaction, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post transactions_url, params: { transaction: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
