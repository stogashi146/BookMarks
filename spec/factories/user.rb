FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.first_name }
    introduction { Faker::Lorem.characters(number:20) }
    password { "password" }
    password_confirmation { password }
    after(:create) {|user| user.confirm}
  end
end
