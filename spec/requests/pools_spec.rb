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

RSpec.describe "/pools", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Pool. As you add validations to Pool, be sure to
  # adjust the attributes here as well.
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:valid_attributes) {
    { block_id: block.id, users_count: 2, signatures_count: 3, amount: 4.5, stage: 5 }
  }

  let(:invalid_attributes) {
    { block_id: "block.id", users_count: 0, signatures_count: 0, amount: 0, stage: 0 }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Pool.create! valid_attributes
      get pools_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      pool = Pool.create! valid_attributes
      get pool_url(pool)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_pool_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      pool = Pool.create! valid_attributes
      get edit_pool_url(pool)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Pool" do
        expect {
          post pools_url, params: { pool: valid_attributes }
        }.to change(Pool, :count).by(1)
      end

      it "redirects to the created pool" do
        post pools_url, params: { pool: valid_attributes }
        expect(response).to redirect_to(pool_url(Pool.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Pool" do
        expect {
          post pools_url, params: { pool: invalid_attributes }
        }.to change(Pool, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post pools_url, params: { pool: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { block_id: block.id, users_count: 2, signatures_count: 3, amount: 9.5, stage: 5 }
      }

      it "updates the requested pool" do
        pool = Pool.create! valid_attributes
        patch pool_url(pool), params: { pool: new_attributes }
        pool.reload
      end

      it "redirects to the pool" do
        pool = Pool.create! valid_attributes
        patch pool_url(pool), params: { pool: new_attributes }
        pool.reload
        expect(response).to redirect_to(pool_url(pool))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        pool = Pool.create! valid_attributes
        patch pool_url(pool), params: { pool: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested pool" do
      pool = Pool.create! valid_attributes
      expect {
        delete pool_url(pool)
      }.to change(Pool, :count).by(-1)
    end

    it "redirects to the pools list" do
      pool = Pool.create! valid_attributes
      delete pool_url(pool)
      expect(response).to redirect_to(pools_url)
    end
  end
end