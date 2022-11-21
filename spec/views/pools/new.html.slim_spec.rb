# frozen_string_literal: true

require "rails_helper"

RSpec.describe "pools/new", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  before(:each) do
    assign(:pool, Pool.new(
      block: block,
      users_count: 1,
      signatures_count: 1,
      amount: 1.5,
      stage: 1
    ))
  end

  it "renders new pool form" do
    render

    assert_select "form[action=?][method=?]", pools_path, "post" do
      assert_select "input[name=?]", "pool[block_id]"

      assert_select "input[name=?]", "pool[users_count]"

      assert_select "input[name=?]", "pool[signatures_count]"

      assert_select "input[name=?]", "pool[amount]"

      assert_select "input[name=?]", "pool[stage]"
    end
  end
end
