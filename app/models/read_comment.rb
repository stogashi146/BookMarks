class ReadComment < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :user
  belongs_to :book_read

  validates :comment, presence: true, length: { maximum: 30 }
end
