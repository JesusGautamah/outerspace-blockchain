# frozen_string_literal: true

require "rails_helper"

RSpec.describe CreateTicketWorker, type: :worker do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:pool) { create(:pool, block: block) }
  let(:user) { create(:user) }
  let(:ticket) { create(:ticket, user: user, pool: pool) }
  let(:worker) { CreateTicketWorker.new }
  let(:word) { create(:acceptable_word) }
  let(:number_sequence) { create(:acceptable_number_sequence) }
  let(:symbol_sequence) { create(:acceptable_symbol_sequence) }

  before(:each) do
    word
    number_sequence
    symbol_sequence
  end

  it "should call create ticket service" do
    time = Time.now
    expect(CreateTicketService).to receive(:new).with(user.id, pool.id, time).and_call_original
    worker.perform(user.id, pool.id, time)
    expect(worker.success?).to be_truthy
  end

  it "should raise error if user not found" do
    expect { worker.perform(9000, pool.id, Time.now) }.to raise_error(StandardError)
  end
end
