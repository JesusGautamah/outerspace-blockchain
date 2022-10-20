require 'rails_helper'

RSpec.describe "chains/edit", type: :view do
  let(:chain) {
    Chain.create!(
      name: "MyString",
      blocks_count: 1,
      maintainer: "MyString",
      chain_version: "MyString",
      description: "MyText"
    )
  }

  before(:each) do
    assign(:chain, chain)
  end

  it "renders the edit chain form" do
    render

    assert_select "form[action=?][method=?]", chain_path(chain), "post" do

      assert_select "input[name=?]", "chain[name]"

      assert_select "input[name=?]", "chain[blocks_count]"

      assert_select "input[name=?]", "chain[maintainer]"

      assert_select "input[name=?]", "chain[chain_version]"

      assert_select "textarea[name=?]", "chain[description]"
    end
  end
end
