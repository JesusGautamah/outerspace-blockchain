# frozen_string_literal: true

require "rails_helper"

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      sender_key: "MyString",
      receiver_key: "MyString",
      status: 0, signature_time: "2022-10-22 19:10:59",
      data: "MyText", upl_file: "MyString",
      upl_file_name: "MyString", upl_file_type: "MyString",
      upl_file_size: "MyString", upl_file_hash: "MyString",
      amount: 1.5, fee: 1.5
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do
      assert_select "input[name=?]", "transaction[sender_key]"

      assert_select "input[name=?]", "transaction[receiver_key]"

      assert_select "input[name=?]", "transaction[confirmed]"

      assert_select "input[name=?]", "transaction[master]"
    end
  end
end
