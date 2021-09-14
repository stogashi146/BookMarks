class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable,
         :omniauthable, omniauth_providers:[:twitter]

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

  # 通知を送信
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  # 通知を受信
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  has_one_attached :profile_image

  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true
  validates :introduction, length: { maximum: 50 }
  validate :profile_image_size

  # ゲストユーザーでログイン
  def self.guest
    find_or_create_by!(email: "guest@book-marks.net") do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
    end
  end

  # twitterログイン
  def self.find_for_oauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)

    user ||= User.new(
      uid: auth.uid,
      provider: auth.provider,
      name: auth[:info][:nickname],
      email: User.dummy_email(auth),
      password: Devise.friendly_token[0, 20]
    )
    user
  end

  def self.follow_include?(follower, follow)
    follower.followings.include?(follow)
  end

  def create_notification_follow(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ?", current_user.id, id, "follow"])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: "follow"
        )
        notification.save if notification.valid?
    end
  end

  # メール送信
  def self.notify_release_book
    self.all.each do |user|
      user.notify_mail_book
    end
  end

  # 前日発売の本があるかチェック
  def notify_mail_book
    if self.is_mail_send == true
      books = []
      self.unread_books.each do |book|
        books << book if book.sales_date == Time.current.tomorrow.to_date
      end
      ReleaseNotificationMailer.send_release_mail(books, self).deliver if books.present?
    end
  end

  # フォローユーザーのアクティビティを取得
  def follow_user_timeline(current_user)
    current_user.followings.each do |follow_user|
      follow_user.active_notifications.where("action = ? or action = ?", "read", "release")
    end
  end

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@bookmarks.net"
  end

  def profile_image_size
    if profile_image.attached? && profile_image.blob.byte_size > 1.megabytes
      profile_image.purge
      errors.add(:profile_image, "は5MB以内にしてください")
    end
  end

end
