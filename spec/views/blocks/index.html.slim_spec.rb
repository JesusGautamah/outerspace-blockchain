require 'rails_helper'

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
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Previous Hash".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Connections".to_s), count: 2
  end
end
