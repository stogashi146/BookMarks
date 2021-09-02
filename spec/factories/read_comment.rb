FactoryBot.define do
  factory :read_comment do
    book_read_id { FactoryBot.create(:book_read).id }
    user_id { FactoryBot.create(:user).id }
    comment { Faker::Lorem.characters(number: 30) }
  end
end