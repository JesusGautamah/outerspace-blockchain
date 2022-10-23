# frozen_string_literal: true

require "rails_helper"

RSpec.describe "contracts/index", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:transaction) { create(:transaction, block: block) }
  before(:each) do
    assign(:contracts, [
      Contract.create!(
        first_sig: "a" * 64,
        second_sig: "b" * 64,
        third_sig: "c" * 64,
        fourth_sig: "d" * 64,
        status: 2,
        transaction_id: transaction.id
      ),
      Contract.create!(
        first_sig: "e" * 64,
        second_sig: "f" * 64,
        third_sig: "g" * 64,
        fourth_sig: "h" * 64,
        status: 2,
        transaction_id: transaction.id
      )
    ])
  end

  it "renders a list of contracts" do
    render
    assert_select "p#first-sig", text: Regexp.new("a{64}"), count: 1
    assert_select "p#second-sig", text: Regexp.new("b{64}"), count: 1
    assert_select "p#third-sig", text: Regexp.new("c{64}"), count: 1
    assert_select "p#fourth-sig", text: Regexp.new("d{64}"), count: 1
    assert_select "p#status", text: Regexp.new("2"), count: 2
    assert_select "p#transaction", text: Regexp.new(transaction.id.to_s), count: 2
    assert_select "p#first-sig", text: Regexp.new("e{64}"), count: 1
    assert_select "p#second-sig", text: Regexp.new("f{64}"), count: 1
    assert_select "p#third-sig", text: Regexp.new("g{64}"), count: 1
    assert_select "p#fourth-sig", text: Regexp.new("h{64}"), count: 1
    
    # assert_select cell_selector, text: Regexp.new(/#{transaction.id}/), count: 1
    # assert_select cell_selector, text: Regexp.new("e{64}"), count: 1
    # assert_select cell_selector, text: Regexp.new("f{64}"), count: 1
    # assert_select cell_selector, text: Regexp.new("g{64}"), count: 1
    # assert_select cell_selector, text: Regexp.new("h{64}"), count: 1
    # assert_select cell_selector, text: Regexp.new(2.to_s), count: 1
    # assert_select cell_selector, text: Regexp.new(/#{transaction.id}/), count: 1
  end
end
