# frozen_string_literal: true

require "rails_helper"

RSpec.describe "tickets/show", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:user) { create(:user) }
  let(:pool) { create(:pool, block: block) }
  before(:each) do
    assign(:ticket, Ticket.create!(
      user: user,
      pool: pool,
      status: :active,
      time_ref: "2021-09-01 15:00:00"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/active/)
  end
end
