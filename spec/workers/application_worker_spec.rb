# frozen_string_literal: true

require "rails_helper"

describe ApplicationWorker, type: :worker do
  let(:worker) { described_class.new }
  let(:user_id) { 1 }
  let(:transaction_id) { 1 }
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }

  describe "#perform" do
    it "raises NotImplementedError" do
      expect { worker.perform }.to raise_error(NotImplementedError)
    end
  end

  describe "#success?" do
    it "returns false" do
      expect(worker.success?).to be_falsey
    end
  end

  describe "UserNotFoundError class" do
    it "raises StandardError" do
      expect(described_class::UserNotFoundError.ancestors).to include(StandardError)
      expect { raise described_class::UserNotFoundError }.to raise_error(StandardError)
      expect { raise described_class::UserNotFoundError }.to raise_error(described_class::UserNotFoundError)
    end

    it "calls dev_error method" do
      expect(worker).to receive(:dev_error)
      worker.rescue_with_handler(described_class::UserNotFoundError.new)
    end
  end

  describe "PoolNotFoundError class" do
    it "raises StandardError" do
      expect(described_class::PoolNotFoundError.ancestors).to include(StandardError)
      expect { raise described_class::PoolNotFoundError }.to raise_error(StandardError)
      expect { raise described_class::PoolNotFoundError }.to raise_error(described_class::PoolNotFoundError)
    end
  end

  describe "#dev_error" do
    let(:error) { StandardError.new("error") }

    before do
      allow(Rails.env).to receive(:development?).and_return(true)
      allow(Rails.env).to receive(:test?).and_return(true)
    end

    it "puts error class and message to console" do
      expect(worker).to receive(:puts).with("#{error.class}: #{error.message}")
      expect(worker).to receive(:puts).with(error.backtrace)
      worker.send(:dev_error, error)
    end
  end

  describe "block check" do
    it "#block_exist? should return false if not block not passed" do
      expect(worker.send(:block_exists?)).to be_falsey
    end
  end

  describe "pool check" do
    it "#pool_exists? should return false if not pool not passed" do
      expect(worker.send(:pool_exists?)).to be_falsey
    end
  end
end
