FactoryBot.define do
  factory :pool do
    block { nil }
    users_count { 1 }
    signatures_count { 1 }
    amount { 1.5 }
    stage { 1 }
  end
end
