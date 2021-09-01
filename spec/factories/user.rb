FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    introduction { Faker::Lorem.characters(number:20) }
    password { "password" }
    password_confirmation { password }
  end
end