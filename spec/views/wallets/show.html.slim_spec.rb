# frozen_string_literal: true

require "rails_helper"

RSpec.describe "wallets/show", type: :view do
  let(:user) { create(:user) }
  before(:each) do
    assign(:wallet, Wallet.create!(
      user: user,
      pr_key: "Pr Key",
      pv_key: "Pv Key",
      balance: 0.0,
      status: :active
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{user.username}/)
    expect(rendered).to match(/0.0/)
    expect(rendered).to match(/active/)
  end
end
