# frozen_string_literal: true

require "rails_helper"

RSpec.describe TransactionToBlockWorker, type: :worker do
  let(:sender_user) { create(:user) }
  let(:receiver_user) { create(:user, username: "rver_user", email: "receiver@email.com") }
  let(:worker) { TransactionToBlockWorker.new }
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:s_wallet) { create(:wallet, user: sender_user) }
  let(:r_wallet) { create(:wallet, user: receiver_user) }

  describe "create transaction" do
    it "should call add transaction service" do
      s_wallet.update!(balance: 10)
      expect(TransactionToBlockService).to receive(:new).with(r_wallet.pr_key, s_wallet.pv_key, 1.5, block.id).and_call_original
      expect(worker).to receive(:block_exists?).and_call_original
      worker.perform(r_wallet.pr_key, s_wallet.pv_key, 1.5, block.id)
      expect(worker.success?).to be_truthy
    end
    it "should raise error if transaction not accepted" do
      expect { worker.perform(s_wallet.pr_key, r_wallet.pv_key, 1000000, block.id) }.to raise_error(ApplicationWorker::AmountNotEnoughError)
    end
  end

  describe "check transaction" do
    it "should raise error if wallet not found" do
      expect { worker.perform(s_wallet.pr_key, "wrong_key", 1.5, block.id) }.to raise_error(ApplicationWorker::WalletNotFoundError)
    end
    it "should raise error if amount not enough" do
      expect { worker.perform(r_wallet.pr_key, s_wallet.pv_key, 1000000, block.id) }.to raise_error(StandardError)
    end
  end

  describe "check block" do
    it "should raise error if block not found" do
      s_wallet.update!(balance: 10)
      expect { worker.perform(r_wallet.pr_key, s_wallet.pv_key, 1.5, 9000) }.to raise_error(ApplicationWorker::BlockNotFoundError)
    end
  end
end
