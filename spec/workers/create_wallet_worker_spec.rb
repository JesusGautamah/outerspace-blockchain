# frozen_string_literal: true

require "rails_helper"

RSpec.describe CreateWalletWorker, type: :worker do
  it "should call create wallet service" do
    user = create(:user)
    expect(CreateWalletService).to receive(:new).with(user.id).and_call_original
    CreateWalletWorker.new.perform(user.id)
  end
end
