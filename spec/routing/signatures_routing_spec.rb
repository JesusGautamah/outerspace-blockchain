# frozen_string_literal: true

require "rails_helper"

RSpec.describe SignaturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/signatures").to route_to("signatures#index")
    end

    it "routes to #new" do
      expect(get: "/signatures/new").to route_to("signatures#new")
    end

    it "routes to #show" do
      expect(get: "/signatures/1").to route_to("signatures#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/signatures/1/edit").to route_to("signatures#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/signatures").to route_to("signatures#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/signatures/1").to route_to("signatures#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/signatures/1").to route_to("signatures#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/signatures/1").to route_to("signatures#destroy", id: "1")
    end
  end
end
