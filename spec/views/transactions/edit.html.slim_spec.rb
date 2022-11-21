# frozen_string_literal: true

require "rails_helper"

RSpec.describe "transactions/edit", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  let(:transaction) {
    Transaction.create!(
      sender_key: "MyString",
      receiver_key: "MyString",
      status: 0, signature_time: "2022-10-22 19:10:59",
      data: "MyText", upl_file: "MyString",
      upl_file_name: "MyString", upl_file_type: "MyString",
      upl_file_size: "MyString", upl_file_hash: "MyString",
      amount: 1.5, fee: 1.5, block_id: block.id
    )
  }

  before(:each) do
    assign(:transaction, transaction)
  end
end
