# frozen_string_literal: true

require "rails_helper"

RSpec.describe "tickets/index", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:pool) { create(:pool, block: block) }
  let(:user) { create(:user) }
  let(:user_2) { create(:user, email: "second@email.com", username: "second") }
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        user: user,
        pool: pool,
        status: 2,
        time_ref: "2021-09-01 15:00:00"
      ),
      Ticket.create!(
        user: user_2,
        pool: pool,
        status: 2,
        time_ref: "2021-09-01 15:00:00"
      )
    ])
  end

  it "renders a list of tickets" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new(user.username), count: 1
    assert_select cell_selector, text: Regexp.new(user_2.username), count: 1
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
