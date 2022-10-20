FactoryBot.define do
  factory :user do
    username { "John Doe" }
    email { "mail@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end

