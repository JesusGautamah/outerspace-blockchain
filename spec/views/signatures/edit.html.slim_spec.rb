# frozen_string_literal: true

require "rails_helper"

RSpec.describe "signatures/edit", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:pool) { create(:pool, block: block) }
  let(:user) { create(:user) }
  let(:user_2) { create(:user, email: "second@email.com", username: "second") }
  let(:wallet) { create(:wallet, user: user) }
  let(:wallet_2) { create(:wallet, user: user_2, pr_key: "second_pr_key", pv_key: "second_pv_key") }
  let(:ticket) { create(:ticket, pool: pool, user: user) }
  let(:transaction) { create(:transaction, block: block, sender_key: wallet.pr_key, receiver_key: wallet_2.pv_key) }
  let(:contract) { create(:contract, blk_transaction: transaction) }
  let(:acceptable_word) { create(:acceptable_word) }
  let(:acceptable_symbol_sequence) { create(:acceptable_symbol_sequence) }
  let(:acceptable_number_sequence) { create(:acceptable_number_sequence) }
  let(:signature) {
    Signature.create!(
      signature: "a" * 64,
      contract: contract,
    )
  }

  before(:each) do
    assign(:signature, signature)
  end
end
