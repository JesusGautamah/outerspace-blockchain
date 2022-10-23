# frozen_string_literal: true

require "rails_helper"

RSpec.describe PoolsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/pools").to route_to("pools#index")
    end

    it "routes to #new" do
      expect(get: "/pools/new").to route_to("pools#new")
    end

    it "routes to #show" do
      expect(get: "/pools/1").to route_to("pools#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/pools/1/edit").to route_to("pools#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/pools").to route_to("pools#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/pools/1").to route_to("pools#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/pools/1").to route_to("pools#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/pools/1").to route_to("pools#destroy", id: "1")
    end
  end
end
