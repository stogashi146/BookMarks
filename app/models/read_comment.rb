class ReadComment < ApplicationRecord
  belongs_to :user
  belongs_to :book_read
end