# frozen_string_literal: true

require "rails_helper"

RSpec.describe CreateWalletService, type: :service do
  let(:user) { create(:user) }
  it "should create wallet" do
    expect { CreateWalletService.new(user.id).call }.to change { Wallet.count }.by(1)
  end
end
