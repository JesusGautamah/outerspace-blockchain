# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChainsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/chains").to route_to("chains#index")
    end

    it "routes to #new" do
      expect(get: "/chains/new").to route_to("chains#new")
    end

    it "routes to #show" do
      expect(get: "/chains/1").to route_to("chains#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/chains/1/edit").to route_to("chains#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/chains").to route_to("chains#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/chains/1").to route_to("chains#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/chains/1").to route_to("chains#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/chains/1").to route_to("chains#destroy", id: "1")
    end
  end
end
