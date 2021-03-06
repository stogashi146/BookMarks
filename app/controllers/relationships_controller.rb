class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    Relationship.create(followed_id: params[:user_id] , follower_id: current_user.id)
    # フォロー通知処理
    @user = User.find(params[:user_id])
    @user.create_notification_follow(current_user)
  end

  def destroy
    @user = User.find(params[:user_id])
    Relationship.find_by(followed_id: @user , follower_id: current_user.id).destroy
  end
end
