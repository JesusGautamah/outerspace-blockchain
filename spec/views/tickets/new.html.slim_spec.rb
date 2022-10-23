# frozen_string_literal: true

require "rails_helper"

RSpec.describe "tickets/new", type: :view do
  before(:each) do
    assign(:ticket, Ticket.new(
      user: nil,
      pool: nil,
      status: 1
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do
      assert_select "input[name=?]", "ticket[user_id]"

      assert_select "input[name=?]", "ticket[pool_id]"

      assert_select "input[name=?]", "ticket[status]"
    end
  end
end
