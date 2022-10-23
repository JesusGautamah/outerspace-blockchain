# frozen_string_literal: true

require "rails_helper"

RSpec.describe "blocks/edit", type: :view do
  let(:chain) { create(:chain) }
  let(:block) {
    Block.create!(
      nonce: 1,
      previous_hash: "MyString",
      block_data: "MyText",
      connections: "MyString",
      chain_id: chain.id
    )
  }

  before(:each) do
    assign(:block, block)
  end

  it "renders the edit block form" do
    render

    assert_select "form[action=?][method=?]", block_path(block), "post" do
      assert_select "input[name=?]", "block[nonce]"

      assert_select "input[name=?]", "block[previous_hash]"

      assert_select "textarea[name=?]", "block[block_data]"

      assert_select "input[name=?]", "block[connections]"
    end
  end
end
