class Book < ApplicationRecord
  has_many :book_reads, dependent: :destroy
  has_many :book_unreads, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :book_tags, dependent: :destroy
end
