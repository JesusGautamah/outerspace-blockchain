# frozen_string_literal: true

require "rails_helper"

RSpec.describe CreateWalletService, type: :service do
  it "should create wallet" do
    user = create(:user)
    expect { CreateWalletService.new(user.id).call }.to change { Wallet.count }.by(1)
  end
end