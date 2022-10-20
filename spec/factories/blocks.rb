FactoryBot.define do
  factory :block do
    nonce { 1 }
    previous_hash { "MyString" }
    block_data { "MyText" }
    connections { "MyString" }
    chain_id { 1 }
  end
end
