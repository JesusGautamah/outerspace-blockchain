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
end
