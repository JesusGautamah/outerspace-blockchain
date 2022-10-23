# frozen_string_literal: true

require "rails_helper"

RSpec.describe ContractsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/contracts").to route_to("contracts#index")
    end

    it "routes to #new" do
      expect(get: "/contracts/new").to route_to("contracts#new")
    end

    it "routes to #show" do
      expect(get: "/contracts/1").to route_to("contracts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/contracts/1/edit").to route_to("contracts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/contracts").to route_to("contracts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/contracts/1").to route_to("contracts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/contracts/1").to route_to("contracts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/contracts/1").to route_to("contracts#destroy", id: "1")
    end
  end
end
