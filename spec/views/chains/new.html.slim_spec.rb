# frozen_string_literal: true

require "rails_helper"

RSpec.describe "chains/new", type: :view do
  before(:each) do
    assign(:chain, Chain.new(
      name: "MyString",
      blocks_count: 1,
      maintainer: "MyString",
      chain_version: "MyString",
      description: "MyText"
    ))
  end

  it "renders new chain form" do
    render

    assert_select "form[action=?][method=?]", chains_path, "post" do
      assert_select "input[name=?]", "chain[name]"

      assert_select "input[name=?]", "chain[blocks_count]"

      assert_select "input[name=?]", "chain[maintainer]"

      assert_select "input[name=?]", "chain[chain_version]"

      assert_select "textarea[name=?]", "chain[description]"
    end
  end
end
