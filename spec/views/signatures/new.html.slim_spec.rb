# frozen_string_literal: true

require "rails_helper"

RSpec.describe "signatures/new", type: :view do
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
    assign(:signature, Signature.new(
      signature: "a" * 64,
      contract: contract,
      common_word: acceptable_word.word,
      symbol_sequence: acceptable_symbol_sequence.seq,
      number_sequence: acceptable_number_sequence.seq,
      verify_sig: "MyString",
      block_hash: "MyString",
      signature_hash: "MyString",
      time_ref: ticket.time_ref
    ))
  end

  it "renders new signature form" do
    render

    assert_select "form[action=?][method=?]", signatures_path, "post" do
      assert_select "input[name=?]", "signature[signature]"

      assert_select "input[name=?]", "signature[contract_id]"

      assert_select "input[name=?]", "signature[common_word]"

      assert_select "input[name=?]", "signature[symbol_sequence]"

      assert_select "input[name=?]", "signature[number_sequence]"

      assert_select "input[name=?]", "signature[verify_sig]"

      assert_select "input[name=?]", "signature[block_hash]"

      assert_select "input[name=?]", "signature[signature_hash]"
    end
  end
end
