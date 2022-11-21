# frozen_string_literal: true

require "rails_helper"

RSpec.describe TransactionsController, type: :controller do
  include Devise::Test::ControllerHelpers
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:user) { create(:user) }
  let(:user_two) { create(:user, username: "user_two", email: "user_two@email.com") }
  let(:wallet) { create(:wallet, user: user) }
  let(:wallet_two) { create(:wallet, user: user_two) }

  let(:valid_attributes) do
    { sender_key: wallet.pr_key, receiver_key: wallet_two.pv_key,
      status: 0, data: "MyText", upl_file: "MyString",
      upl_file_name: "MyString", upl_file_type: "MyString",
      upl_file_size: "MyString", upl_file_hash: "MyString",
      amount: 1.5, fee: 1.5, block_id: block.id }
  end

  describe "GET /new has to instantiate a new transaction" do
    it "renders a successful response" do
      chain
      block
      sign_in user
      get :new
      expect(response).to be_successful
      expect(assigns(:transaction)).to be_a_new(Transaction)
    end
  end
end
