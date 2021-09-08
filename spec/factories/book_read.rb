FactoryBot.define do
  factory :book_read do
    user_id { FactoryBot.create(:user).id }
    book_id { FactoryBot.create(:book).id }
    rate { Faker::Number.between(from: 1, to: 5) }
    comment { Faker::Lorem.characters(number: 30) }
  end
end