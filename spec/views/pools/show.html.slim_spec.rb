# frozen_string_literal: true

require "rails_helper"

RSpec.describe "pools/show", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  before(:each) do
    assign(:pool, Pool.create!(
      block: block,
      users_count: 2,
      signatures_count: 3,
      amount: 4.5,
      stage: 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/5/)
  end
end
