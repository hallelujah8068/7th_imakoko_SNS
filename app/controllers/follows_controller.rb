class FollowsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @user = User.find(params[:id])

      #現在フォローしているユーザー取得
      @following_users = @user.followings

      #フォローしたことのある全てのユーザー取得
      follow = Follow.with_deleted.where(follower_id_id: current_user.id)
      followed_ids = follow.pluck(:following_id_id)
      @followed_user = User.where(id: followed_ids)

    end
  
  end