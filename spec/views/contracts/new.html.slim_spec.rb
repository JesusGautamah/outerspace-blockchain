# frozen_string_literal: true

require "rails_helper"

RSpec.describe "contracts/new", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:transaction) { create(:transaction, block: block) }
  before(:each) do
    assign(:contract, Contract.new(
      status: 1,
      transaction_id: transaction.id
    ))
  end

  it "renders new contract form" do
    render

    assert_select "form[action=?][method=?]", contracts_path, "post" do
      assert_select "input[name=?]", "contract[first_sig]"

      assert_select "input[name=?]", "contract[second_sig]"

      assert_select "input[name=?]", "contract[third_sig]"

      assert_select "input[name=?]", "contract[fourth_sig]"

      assert_select "input[name=?]", "contract[status]"

      assert_select "input[name=?]", "contract[transact_id]"
    end
  end
end
