FactoryBot.define do
  factory :ticket do
    user { nil }
    pool { nil }
    status { "active" }
    time_ref { "2021-09-01 15:00:00" }
  end
end
