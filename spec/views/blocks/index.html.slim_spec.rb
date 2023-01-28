# frozen_string_literal: true

require "rails_helper"

RSpec.describe "blocks/index", type: :view do
  let(:chain) { create(:chain) }
  before(:each) do
    assign(:blocks, [
      Block.create!(
        nonce: 2,
        previous_hash: "Previous Hash",
        block_data: "MyText",
        connections: "Connections",
        chain_id: chain.id
      ),
      Block.create!(
        nonce: 2,
        previous_hash: "Previous Hash",
        block_data: "MyText",
        connections: "Connections",
        chain_id: chain.id
      )
    ])
  end

  it "renders a list of blocks" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Block 49")
    assert_select cell_selector, text: Regexp.new("Block 50")
  end
end
