class TimelinesController < ApplicationController
  def index
    @timelines = current_user.passive_notifications.where("action = ? or action = ?", "read", "release")
    # follow_user_timeline
    # binding.pry
    # current_user.followings.each do |follow_user|
    #   if follow_user_timeline.present?
    #     follow_user_timeline + follow_user.active_notifications.where("action = ? or action = ?", "read", "release")
    #  else
    #    follow_user_timeline = follow_user.active_notifications.where("action = ? or action = ?", "read", "release")
    #  end
    # end
    follow_user_timelines = Notification.joins(:visitor => :followers).where("relationships.follower_id = ?", current_user.id).where("action = ? or action = ?", "read", "release").distinct
    #@timelines << Notification.where(id: follow_user_timeline.ids)
    @timelines = @timelines + follow_user_timelines
    @timelines = @timelines.sort_by{|x| x.created_at}.reverse
  end
end
