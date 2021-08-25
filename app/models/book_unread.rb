class BookUnread < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :user
  belongs_to :book

  # 発売日通知メソッド
  def create_notification_release(current_user)
    # 発売日通知
    notification = current_user.active_notifications.new(
      book_id: book_id,
      book_unread_id: id,
      visited_id: current_user.id,
      action: "release"
      )
      #発売後の本については、通知済みとする
      if notification.book.sales_date.present? && notification.book.sales_date < Time.current.to_date
        notification.checked = true
      end
      notification.save if notification.valid?
  end

  # 発売日のレコード作成
  def destroy_notification_release(current_user)
    notification = current_user.active_notifications.find_by(
        book_id: book_id,
        book_unread_id: id,
        visited_id: current_user.id,
        action: "release"
        )
    notification.destroy if notification.present?
  end

end
