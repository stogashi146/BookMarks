class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :book
  belongs_to :book_read, optional: true
  belongs_to :book_unread, optional: true
  belongs_to :read_comment, optional: true
end
