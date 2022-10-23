# frozen_string_literal: true

require "rails_helper"

RSpec.describe "chains/show", type: :view do
  before(:each) do
    assign(:chain, Chain.create!(
      name: "Name",
      blocks_count: 2,
      maintainer: "Maintainer",
      chain_version: "Chain Version",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Maintainer/)
    expect(rendered).to match(/Chain Version/)
    expect(rendered).to match(/MyText/)
  end
end
