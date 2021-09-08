class ReadComment < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :user
  belongs_to :book_read

  validates :book_read_id, presence: true
  validates :user_id, presence: true
  validates :comment, presence: true, length: { maximum: 30 }
end
