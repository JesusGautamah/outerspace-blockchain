# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  describe "GET #home" do
    it "returns http success" do
      chain
      block
      get :home
      expect(response).to have_http_status(:success)
    end
  end
end
