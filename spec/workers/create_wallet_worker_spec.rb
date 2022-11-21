# frozen_string_literal: true

require "rails_helper"

RSpec.describe CreateWalletWorker, type: :worker do
  let(:user) { create(:user) }
  let(:worker) { CreateWalletWorker.new }
  it "should call create wallet service" do
    expect(CreateWalletService).to receive(:new).with(user.id).and_call_original
    worker.perform(user.id)
    expect(worker.success?).to be_truthy
  end

  it "should raise error if user not found" do
    expect { worker.perform(9000) }.to raise_error(StandardError)
  end
end
