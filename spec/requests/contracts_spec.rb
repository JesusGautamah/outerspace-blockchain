# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/contracts", type: :request do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:transaction) { create(:transaction, block: block) }
  # every signature hash is 64 characters long
  let(:valid_attributes) { { first_sig: "a" * 64, second_sig: "b" * 64,
                             third_sig: "c" * 64, fourth_sig: "d" * 64,
                             status: 1, transaction_id: transaction.id } }

  let(:invalid_attributes) { { first_sig: "MyString", second_sig: "MyString",
                               third_sig: "MyString", fourth_sig: "MyString",
                               status: 0, transaction_id: transaction.id } }

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

  describe "GET /new" do
    it "renders a successful response" do
      get new_contract_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      contract = Contract.create! valid_attributes
      get edit_contract_url(contract)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Contract" do
        expect {
          post contracts_url, params: { contract: valid_attributes }
        }.to change(Contract, :count).by(1)
      end

      it "redirects to the created contract" do
        post contracts_url, params: { contract: valid_attributes }
        expect(response).to redirect_to(contract_url(Contract.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Contract" do
        expect {
          post contracts_url, params: { contract: invalid_attributes }
        }.to change(Contract, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post contracts_url, params: { contract: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { first_sig: "a" * 64, second_sig: "b" * 64 } }

      it "updates the requested contract" do
        contract = Contract.create! valid_attributes
        patch contract_url(contract), params: { contract: new_attributes }
        contract.reload
      end

      it "redirects to the contract" do
        contract = Contract.create! valid_attributes
        patch contract_url(contract), params: { contract: new_attributes }
        contract.reload
        expect(response).to redirect_to(contract_url(contract))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        contract = Contract.create! valid_attributes
        patch contract_url(contract), params: { contract: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested contract" do
      contract = Contract.create! valid_attributes
      expect {
        delete contract_url(contract)
      }.to change(Contract, :count).by(-1)
    end

    it "redirects to the contracts list" do
      contract = Contract.create! valid_attributes
      delete contract_url(contract)
      expect(response).to redirect_to(contracts_url)
    end
  end
end
