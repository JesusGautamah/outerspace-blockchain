# frozen_string_literal: true

require "rails_helper"

RSpec.describe "contracts/index", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:transaction) { create(:transaction, block: block) }
  before(:each) do
    assign(:contracts, [
      Contract.create!(
        status: 2,
        transaction_id: transaction.id
      ),
      Contract.create!(
        status: 2,
        transaction_id: transaction.id
      )
    ])
  end

  it "renders a list of contracts" do
    render
    assert_select "p#status", text: Regexp.new("2"), count: 2
    assert_select "p#transaction", text: Regexp.new(transaction.id.to_s), count: 2
  end
end
