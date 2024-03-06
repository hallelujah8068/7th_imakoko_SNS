class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
    @post_new = Post.new
    @following = current_user.following

    if current_user != @user
      @followed_users = @user.followings
    else
      follow = Follow.with_deleted.where(follower_id_id: current_user.id)
      followed_ids = follow.pluck(:following_id_id)
      @followed_users = User.where(id: followed_ids)
    end
  end
end
