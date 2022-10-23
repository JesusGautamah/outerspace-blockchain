# frozen_string_literal: true

require "rails_helper"

RSpec.describe "transactions/index", type: :view do
  let(:chain) { create(:chain) }
  let(:block) { create(:block, chain: chain) }
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        sender_key: "Sender Key",
        receiver_key: "Receiver Key",
        status: 0, signature_time: "2022-10-22 19:10:59",
        data: "MyText", upl_file: "MyString",
        upl_file_name: "MyString", upl_file_type: "MyString",
        upl_file_size: "MyString", upl_file_hash: "MyString",
        amount: 1.5, fee: 1.5, block_id: block.id
      ),
      Transaction.create!(
        sender_key: "Sender Key",
        receiver_key: "Receiver Key",
        status: 0, signature_time: "2022-10-22 19:10:59",
        data: "MyText", upl_file: "MyString",
        upl_file_name: "MyString", upl_file_type: "MyString",
        upl_file_size: "MyString", upl_file_hash: "MyString",
        amount: 1.5, fee: 1.5, block_id: block.id
      )
    ])
  end

  it "renders a list of transactions" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Sender Key".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Receiver Key".to_s), count: 2
  end
end
