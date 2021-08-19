class ReadFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :book_read

  def create_notification_fav(current_user)
    # 既にいいねされているか検索
    temp = Notification.where(visitor_id:current_user.id ,visited_id:user_id,read_comment_id:id ,action:favorite  )
    # いいねがなければ、通知レコード作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        book_id: id,
        visited_id: user_id,
        action: "favorite"
        )
      #
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

end
