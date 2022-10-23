# frozen_string_literal: true

require "rails_helper"

RSpec.describe "wallets/index", type: :view do
  let(:user) { create(:user) }
  before(:each) do
    assign(:wallets, [
      Wallet.create!(
        user: user,
        balance: 0.0,
        status: :active
      ),
      Wallet.create!(
        user: user,
        balance: 0.0,
        status: :active
      )
    ])
  end

  it "renders a list of wallets" do
    render
    assert_select "p#w_username", text: Regexp.new(user.username), count: 2
    assert_select "p#w_balance", text: Regexp.new(0.0.to_s), count: 2
    assert_select "p#w_status", text: Regexp.new("active"), count: 2
  end
end
