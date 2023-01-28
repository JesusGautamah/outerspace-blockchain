# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationService, type: :service do
  let(:service) { ApplicationService.new }

  describe "#dev_error" do
    let(:error) { StandardError.new("error") }

    before do
      allow(Rails.env).to receive(:development?).and_return(true)
      allow(Rails.env).to receive(:test?).and_return(true)
    end

    it "puts error class and message to console" do
      expect(service).to receive(:puts).with("#{error.class}: #{error.message}")
      expect(service).to receive(:puts).with(error.backtrace)
      service.send(:dev_error, error)
    end
  end

  describe "#wallet_exists?" do
    let(:user) { create(:user) }
    let(:wallet) { create(:wallet, user: user) }

    it "returns true if wallet exists" do
      wallet
      expect(service.send(:wallet_exists?, :user_id, user.id)).to be_truthy
    end

    it "returns false if wallet does not exist" do
      expect(service.send(:wallet_exists?, :user_id, 9000)).to be_falsey
    end
  end

  describe "#user_exists?" do
    it "returns false if user does not exist" do
      expect(service.send(:user_exists?)).to be_falsey
    end
  end
end
