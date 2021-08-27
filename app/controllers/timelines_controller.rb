class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def index
    @timelines = current_user.passive_notifications.where("action = ? or action = ?", "read", "release")
    follow_user_timelines = Notification.joins(:visitor => :followers).where("relationships.follower_id = ?", current_user.id).where("action = ? or action = ?", "read", "release").distinct
    @timelines = @timelines + follow_user_timelines
    @timelines = @timelines.sort_by{|x| x.created_at}.reverse
  end
end
