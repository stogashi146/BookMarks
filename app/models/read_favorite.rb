class ReadFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :book_read

  validates :user_id, presence: true
  validates :book_read_id, presence: true


end
