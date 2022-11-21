# frozen_string_literal: true

require "rails_helper"

RSpec.describe "blocks/new", type: :view do
  let(:chain) { create(:chain) }
  before(:each) do
    assign(:block, Block.new(
      nonce: 1,
      previous_hash: "MyString",
      block_data: "MyText",
      connections: "MyString",
      chain_id: 1
    ))
  end

  it "renders new block form" do
    render

    assert_select "form[action=?][method=?]", blocks_path, "post" do
      assert_select "input[name=?]", "block[nonce]"

      assert_select "input[name=?]", "block[previous_hash]"

      assert_select "textarea[name=?]", "block[block_data]"

      assert_select "input[name=?]", "block[connections]"
    end
  end
end
