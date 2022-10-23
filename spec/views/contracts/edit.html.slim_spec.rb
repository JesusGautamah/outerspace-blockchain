# frozen_string_literal: true

require "rails_helper"

RSpec.describe "contracts/edit", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:transaction) { create(:transaction, block: block) }
  let(:contract) {
    Contract.create!(
      first_sig:  "a" * 64,
      second_sig: "b" * 64,
      third_sig:  "c" * 64,
      fourth_sig: "d" * 64,
      status: 1,
      transaction_id: transaction.id
    )
  }

  before(:each) do
    assign(:contract, contract)
  end

  it "renders the edit contract form" do
    render

    assert_select "form[action=?][method=?]", contract_path(contract), "post" do
      assert_select "input[name=?]", "contract[first_sig]"

      assert_select "input[name=?]", "contract[second_sig]"

      assert_select "input[name=?]", "contract[third_sig]"

      assert_select "input[name=?]", "contract[fourth_sig]"

      assert_select "input[name=?]", "contract[status]"

      assert_select "input[name=?]", "contract[transact_id]"
    end
  end
end
