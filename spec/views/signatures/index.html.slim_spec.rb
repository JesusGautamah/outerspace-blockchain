# frozen_string_literal: true

require "rails_helper"

RSpec.describe "signatures/index", type: :view do
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
  before(:each) do
    assign(:signatures, [
      Signature.create!(
        signature: "a" * 64,
        contract: contract,
        common_word: acceptable_word.word,
        symbol_sequence: acceptable_symbol_sequence.seq,
        number_sequence: acceptable_number_sequence.seq,
        verify_sig: "Verify Sig",
        block_hash: "Block Hash",
        signature_hash: "Hashed",
        time_ref: ticket.time_ref
      ),
      Signature.create!(
        signature: "b" * 64,
        contract: contract,
        common_word: acceptable_word.word,
        symbol_sequence: acceptable_symbol_sequence.seq,
        number_sequence: acceptable_number_sequence.seq,
        verify_sig: "Verify Sig",
        block_hash: "Block Hash",
        signature_hash: "Hashed",
        time_ref: ticket.time_ref
      )
    ])
  end

  it "renders a list of signatures" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("a" * 64), count: 1
    assert_select cell_selector, text: Regexp.new(contract.id.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(acceptable_word.word), count: 2
    assert_select cell_selector, text: Regexp.new(acceptable_symbol_sequence.seq), count: 2
    assert_select cell_selector, text: Regexp.new(acceptable_number_sequence.seq), count: 2
    assert_select cell_selector, text: Regexp.new("Verify Sig".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Block Hash".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Hashed".to_s), count: 2
  end
end
