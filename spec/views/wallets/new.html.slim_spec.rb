# frozen_string_literal: true

require "rails_helper"

RSpec.describe "wallets/new", type: :view do
  before(:each) do
    assign(:wallet, Wallet.new(
      user: nil,
      pr_key: "MyString",
      pv_key: "MyString",
      balance: 0.0,
      status: 1
    ))
  end

  it "renders new wallet form" do
    render

    assert_select "form[action=?][method=?]", wallets_path, "post" do
      assert_select "input[name=?]", "wallet[user_id]"

      assert_select "input[name=?]", "wallet[pr_key]"

      assert_select "input[name=?]", "wallet[pv_key]"

      assert_select "input[name=?]", "wallet[balance]"

      assert_select "input[name=?]", "wallet[status]"
    end
  end
end
