require 'rails_helper'

RSpec.describe "blocks/show", type: :view do
  let(:chain) { create(:chain) }
  before(:each) do
    assign(:block, Block.create!(
      nonce: 2,
      previous_hash: "Previous Hash",
      block_data: "MyText",
      connections: "Connections",
      chain_id: chain.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Previous Hash/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Connections/)
  end
end
