class RelationshipsController < ApplicationController
  def create
    Relationship.create(followed_id: params[:user_id] , follower_id: current_user.id)
    redirect_to request.referer
  end

  def destroy
    Relationship.find_by(followed_id: params[:user_id] , follower_id: current_user.id).destroy
    redirect_to request.referer
  end
end
