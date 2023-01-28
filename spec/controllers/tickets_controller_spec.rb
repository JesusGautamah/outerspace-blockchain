# frozen_string_literal: true

require "rails_helper"

RSpec.describe TicketsController, type: :controller do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:pool) { create(:pool, block: block) }
  let(:user) { create(:user) }
  let(:user_two) { create(:user, email: 'lorem@ipsum.com', username: 'lorem', password: 'loremaludias', password_confirmation: 'loremaludias') }
  let(:wallet) { create(:wallet, user: user) }
  let(:wallet_two) { create(:wallet, user: user_two) }
  let(:transaction) { create(:transaction, sender_key: wallet.pv_key, receiver_key: wallet_two.pr_key, amount: 100 , fee: 10, block: block) }
  let(:transaction_two) { create(:transaction, sender_key: wallet.pv_key, receiver_key: wallet_two.pr_key, amount: 100 , fee: 10, block: block) }
  let(:contract) { create(:contract, blk_transaction: transaction) }
  let(:contract_two) { create(:contract, blk_transaction: transaction_two) }
  let(:word) { create(:acceptable_word) }
  let(:number_sequence) { create(:acceptable_number_sequence) }
  let(:symbol_sequence) { create(:acceptable_symbol_sequence) }
  let(:ticket) { create(:ticket, pool: pool, user: user, transaction_id_list: [transaction.id, transaction_two.id]) }

  let(:ticket) { create(:ticket, user: user, pool: pool) }
  describe "GET #index" do
    it "returns http success" do
      chain
      block
      ticket
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      chain
      block
      ticket
      sign_in user
      get :show, params: { id: ticket.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      chain
      block
      ticket
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      chain
      block
      ticket
      sign_in user
      get :edit, params: { id: ticket.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success but not create ticket" do
      chain
      block
      Ticket.create(user_id: user.id, pool_id: pool.id, status: 'active', time_ref: Time.now, transaction_id_list: [transaction.id, transaction_two.id])
      sign_in user
      transaction
      transaction_two
      contract
      contract_two
      post :create, params: { ticket: { block_id: block.id, user_id: user.id, pool_id: pool.id } }
      #should redirect to tickets path with notice "Processing ticket, please wait, wait a minute and refresh the page"

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq("You already have a ticket in this pool")
      # expect Tickets count
      expect(Ticket.count).to eq(1)
    end

    it "redirects to root path with notice no transactions yet" do
      chain
      block
      sign_in user
      post :create, params: { ticket: {user_id: user.id, pool_id: pool.id, status: 'pending', time_ref: Time.now, transaction_id_list: [] } }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq("No transactions yet")
    end


    it "returns http success and create ticket" do
      chain
      block
      transaction
      transaction_two
      contract
      contract_two
      sign_in user
      post :create, params: { ticket: { user_id: user.id, pool_id: pool.id, status: 'pending', time_ref: Time.now, transaction_id_list: [transaction.id, transaction_two.id] } }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(tickets_path)
      expect(flash[:notice]).to eq("Processing ticket, please wait, wait a minute and refresh the page")
    end
  end
end
