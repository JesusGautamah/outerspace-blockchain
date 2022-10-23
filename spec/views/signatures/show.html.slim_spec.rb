# frozen_string_literal: true

require "rails_helper"

RSpec.describe "signatures/show", type: :view do
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
    assign(:signature, Signature.create!(
      signature: "S" * 64,
      contract: contract,
      common_word: acceptable_word.word,
      symbol_sequence: acceptable_symbol_sequence.seq,
      number_sequence: acceptable_number_sequence.seq,
      verify_sig: "Verify Sig",
      block_hash: "Block Hash",
      signature_hash: "Signature Hash",
      time_ref: ticket.time_ref
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Signature/)
    expect(rendered).to match(//)
    expect(rendered).to match(/#{acceptable_word.word}/)
    expect(rendered).to match(/#{acceptable_symbol_sequence.seq}/)
    expect(rendered).to match(/#{acceptable_number_sequence.seq}/)
    expect(rendered).to match(/Verify Sig/)
    expect(rendered).to match(/Block Hash/)
    expect(rendered).to match(/Signature Hash/)
  end
end
