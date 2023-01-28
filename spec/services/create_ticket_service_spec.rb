# frozen_string_literal: true

require "rails_helper"

RSpec.describe CreateTicketService, type: :service do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:pool) { create(:pool, block: block) }
  let(:user) { create(:user) }
  let(:ticket) { create(:ticket, user: user, pool: pool) }
  let(:ticket_params) { attributes_for(:ticket, user: user, pool: pool) }
  let(:service) { CreateTicketService.new(user.id, pool.id, Time.now) }
  let(:word) { create(:acceptable_word) }
  let(:number_sequence) { create(:acceptable_number_sequence) }
  let(:symbol_sequence) { create(:acceptable_symbol_sequence) }

  describe "#call" do
    it "creates a ticket" do
      word
      number_sequence
      symbol_sequence
      expect { service.call }.to change(Ticket, :count).by(1)
    end
  end
end