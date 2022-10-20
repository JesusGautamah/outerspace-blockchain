# frozen_string_literal: true

require "rails_helper"

RSpec.describe Wallet, type: :model do
  let(:user) { create(:user) }
  let(:wallet) { create(:wallet, user: user) }

  it "is valid with valid attributes" do
    expect(wallet).to be_valid
  end

  it "is not valid without a user" do
    wallet.user = nil
    expect(wallet).to_not be_valid
  end

  it "is expected to have a balance of 0.0" do
    expect(wallet.balance).to eq(0.0)
  end

  it "is expected to have a status of active" do
    expect(wallet.status).to eq("active")
  end

  it "is expected to have a pr_key" do
    expect(wallet.pr_key).to_not be_nil
  end

  it "is expected to have a pv_key" do
    expect(wallet.pv_key).to_not be_nil
  end

  it "is expected to have a pr_key of 64 characters" do
    expect(wallet.pr_key.length).to eq(64)
  end

  it "is expected to have a pv_key of 64 characters" do
    expect(wallet.pv_key.length).to eq(64)
  end

  it "is expected to change keys afeter create_keys" do
    pr_key = wallet.pr_key
    pv_key = wallet.pv_key
    wallet.create_keys
    expect(wallet.pr_key).to_not eq(pr_key)
    expect(wallet.pv_key).to_not eq(pv_key)
  end

  it "is expected to raise error if keys already exists" do
    wallet.create_keys("test", "test")
    wallet.save
    expect { wallet.create_keys("test", "test") }.to raise_error(RuntimeError)
  end
end
