# frozen_string_literal: true

require "rails_helper"

RSpec.describe "wallets/edit", type: :view do
  let(:user) { create(:user) }
  let(:wallet) {
    Wallet.create!(
      user: user,
      pr_key: "MyString",
      pv_key: "MyString",
      balance: 0.0,
      status: 1
    )
  }

  before(:each) do
    assign(:wallet, wallet)
  end

  it "renders the edit wallet form" do
    render

    assert_select "form[action=?][method=?]", wallet_path(wallet), "post" do
      assert_select "input[name=?]", "wallet[user_id]"

      assert_select "input[name=?]", "wallet[pr_key]"

      assert_select "input[name=?]", "wallet[pv_key]"

      assert_select "input[name=?]", "wallet[balance]"

      assert_select "input[name=?]", "wallet[status]"
    end
  end
end
