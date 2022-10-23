FactoryBot.define do
  factory :contract do
    first_sig { "a" * 64 }
    second_sig { "b" * 64 }
    third_sig { "c" * 64 }
    fourth_sig { "d" * 64 }
    status { 0 }
    transaction_id { 1 }
  end
end
