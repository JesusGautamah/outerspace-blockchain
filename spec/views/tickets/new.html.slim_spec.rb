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
end
