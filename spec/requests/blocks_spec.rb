require 'rails_helper'

RSpec.describe "/blocks", type: :request do
  let(:chain) { create(:chain) }
  let(:valid_attributes) { { nonce: 1, previous_hash: "MyString",
                             block_data: "MyText", connections: "MyString",
                             chain_id: chain.id } }

  describe "GET /index" do
    it "renders a successful response" do
      Block.create! valid_attributes
      get blocks_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      block = Block.create! valid_attributes
      get block_url(block)
      expect(response).to be_successful
    end
  end
end
