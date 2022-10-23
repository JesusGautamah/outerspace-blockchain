# frozen_string_literal: true

require "rails_helper"

RSpec.describe "pools/index", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  before(:each) do
    assign(:pools, [
      Pool.create!(
        block: block,
        users_count: 0,
        signatures_count: 6,
        amount: 4.9,
        stage: 5
      ),
      Pool.create!(
        block: block,
        users_count: 0,
        signatures_count: 6,
        amount: 4.9,
        stage: 5
      )
    ])
  end

  it "renders a list of pools" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new(block.id.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(0.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(6.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.9.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(5.to_s), count: 4
  end
end
