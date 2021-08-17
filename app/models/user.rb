class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :book_reads, dependent: :destroy
  has_many :book_unreads, dependent: :destroy
  has_many :read_books, through: :book_reads, source: :book
  has_many :unread_books, through: :book_unreads, source: :book
  has_many :read_comments, dependent: :destroy
  has_many :read_favorites, dependent: :destroy

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed

  has_one :sns_acount, dependent: :destroy

  validates  :name_id, presence: true
  attachment :image

  def self.follow_include?(follower, follow)
    follower.followings.include?(follow)
  end

end
