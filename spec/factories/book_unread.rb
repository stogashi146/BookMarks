FactoryBot.define do
  factory :book_unread do
    user_id { FactoryBot.create(:user).id }
    book_id { FactoryBot.create(:book).id }
  end
end