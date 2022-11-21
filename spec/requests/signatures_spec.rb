# frozen_string_literal: true

require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/signatures", type: :request do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:pool) { create(:pool, block: block) }
  let(:user) { create(:user) }
  let(:user_2) { create(:user, email: "second@email.com", username: "second") }
  let(:wallet) { create(:wallet, user: user) }
  let(:wallet_2) { create(:wallet, user: user_2, pr_key: "second_pr_key", pv_key: "second_pv_key") }
  let(:ticket) { create(:ticket, pool: pool, user: user) }
  let(:transaction) { create(:transaction, block: block, sender_key: wallet.pr_key, receiver_key: wallet_2.pv_key) }
  let(:contract) { create(:contract, blk_transaction: transaction) }
  let(:acceptable_word) { create(:acceptable_word) }
  let(:acceptable_symbol_sequence) { create(:acceptable_symbol_sequence) }
  let(:acceptable_number_sequence) { create(:acceptable_number_sequence) }
  let(:valid_attributes) { { signature: "a" * 64, contract_id: contract.id , user_id: user.id , ticket_id: ticket.id } }

  let(:invalid_attributes) {
    { signature: "a" * 64,
      contract_id: contract.id,
      common_word: "0000",
      symbol_sequence: "0000",
      number_sequence: "invalid",
      verify_sig: "Verify Sig",
      block_hash: "Block Hash",
      signature_hash: "Hashed",
      time_ref: ticket.time_ref }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Signature.create! valid_attributes
      get signatures_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      signature = Signature.create! valid_attributes
      get signature_url(signature)
      expect(response).to be_successful
    end
  end
end
