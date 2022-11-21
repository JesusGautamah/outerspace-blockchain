FactoryBot.define do
  factory :transaction do
    sender_key { "MyString" }
    receiver_key { "MyString" }
    signature_time { "2022-10-22 19:10:59" }
    status { 0 }
    data { "MyText" }
    upl_file { "MyString" }
    upl_file_name { "MyString" }
    upl_file_type { "MyString" }
    upl_file_size { "MyString" }
    upl_file_hash { "MyString" }
    amount { 1.5 }
    fee { 1.5 }
  end
end
