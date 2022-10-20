FactoryBot.define do
  factory :wallet do
    user { nil }
    pr_key { "MyString" }
    pv_key { "MyString" }
    balance { 0.0 }
    status { 0 }
  end
end
