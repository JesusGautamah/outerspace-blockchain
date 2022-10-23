# frozen_string_literal: true

require "rails_helper"

RSpec.describe "tickets/edit", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:pool) { create(:pool, block: block) }
  let(:user) { create(:user) }
  let(:ticket) {
    Ticket.create!(
      user: user,
      pool: pool,
      status: 1,
      time_ref: "2021-09-01 15:00:00"
    )
  }

  before(:each) do
    assign(:ticket, ticket)
  end

  it "renders the edit ticket form" do
    render

    assert_select "form[action=?][method=?]", ticket_path(ticket), "post" do
      assert_select "input[name=?]", "ticket[user_id]"

      assert_select "input[name=?]", "ticket[pool_id]"

      assert_select "input[name=?]", "ticket[status]"
    end
  end
end
