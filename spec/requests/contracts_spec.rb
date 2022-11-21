# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/contracts", type: :request do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:transaction) { create(:transaction, block: block) }
  # every signature hash is 64 characters long
  let(:valid_attributes) { { status: 1, transaction_id: transaction.id } }

  let(:invalid_attributes) { { status: 0, transaction_id: "tr_one" } }

  describe "GET /index" do
    it "renders a successful response" do
      Contract.create! valid_attributes
      get contracts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      contract = Contract.create! valid_attributes
      get contract_url(contract)
      expect(response).to be_successful
    end
  end
end
