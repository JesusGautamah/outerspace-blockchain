FactoryBot.define do
  factory :block do
    nonce { 0 }
    previous_hash { "MyString" }
    block_data { "MyText" }
    connections { 0 }
    chain_id { 1 }
  end
end
