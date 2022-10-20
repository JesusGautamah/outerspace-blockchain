require "rails_helper"

RSpec.describe BlocksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/blocks").to route_to("blocks#index")
    end

    it "routes to #show" do
      expect(get: "/blocks/1").to route_to("blocks#show", id: "1")
    end
  end
end
