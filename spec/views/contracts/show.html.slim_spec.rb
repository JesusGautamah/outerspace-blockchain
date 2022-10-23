# frozen_string_literal: true

require "rails_helper"

RSpec.describe "contracts/show", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:transaction) { create(:transaction, block: block) }
  before(:each) do
    assign(:contract, Contract.create!(
      status: 2,
      transaction_id: transaction.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
