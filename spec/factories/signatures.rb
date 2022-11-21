FactoryBot.define do
  factory :signature do
    signature { "MyString" }
    time_ref { "2022-10-23 08:35:39" }
    contract { nil }
    common_word { "MyString" }
    symbol_sequence { "MyString" }
    number_sequence { "MyString" }
    verify_sig { "MyString" }
    block_hash { "MyString" }
    signature_hash { "MyString" }
  end
end
