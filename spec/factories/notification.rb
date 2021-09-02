FactoryBot.define do
  factory :notification do
    visitor_id { FactoryBot.create(:user).id }
    visited_id { FactoryBot.create(:user).id }
    book_id { FactoryBot.create(:book).id }
    book_read_id { FactoryBot.create(:book_read).id }
    book_unread_id { FactoryBot.create(:book_unread).id }
    read_comment_id { FactoryBot.create(:read_comment).id }
    checked { false }
  end
end