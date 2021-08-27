module NotificationsHelper
  def unchecked_notifications
    notifications = current_user.passive_notifications.where(checked: false)
    dont_notify_ids = []
    notifications.where(action: "release").each do |notification|
      unless notification.book.sales_date == Time.current.to_date
        notifications = notifications.where.not(id: notification.id)
      end
    end
    return notifications
  end
end

