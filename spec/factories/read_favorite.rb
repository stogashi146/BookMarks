FactoryBot.define do
  factory :read_favorite do
    book_read_id { FactoryBot.create(:book_read).id }
    user_id { FactoryBot.create(:user).id }
  end
end