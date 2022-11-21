# frozen_string_literal: true

require "rails_helper"

RSpec.describe TransactionToBlockService, type: :service do
  let(:sender_user) { create(:user) }
  let(:receiver_user) { create(:user, email: "receiver@mail.com", username: "receiver") }
  let(:sender_wallet) { create(:wallet, user: sender_user) }
  let(:receiver_wallet) { create(:wallet, user: receiver_user) }
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:update_block) { block.update!(master_hash: "master_hash") }
  let(:service) { TransactionToBlockService.new(receiver_wallet.pr_key, sender_wallet.pv_key, 1.5, block.id) }
  let(:service_two) { TransactionToBlockService.new(receiver_wallet.pr_key, "maybe", 1.5, block.id) }

  describe "create transaction" do
    it "should call refresh_block method if block confirmed" do
      create(:block, chain: chain, previous_hash: "master_hash", nonce: 1)
      update_block
      sender_wallet.update!(balance: 10)
      expect(service).to receive(:refresh_block).and_call_original
      expect(service.call).to be_truthy
    end

    it "should return false if transaction not accepted" do
      expect(service_two.call).to be_falsey
    end
  end
end
