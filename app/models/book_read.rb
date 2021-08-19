class BookRead < ApplicationRecord
  has_many :read_comments, dependent: :destroy
  has_many :read_favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :user
  belongs_to :book

  acts_as_taggable

  def favorited_by?(user)
    read_favorites.where(user_id: user.id).exists?
  end

end
