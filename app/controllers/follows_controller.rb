class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
    @post_new = Post.new

    if current_user != @user
      # ログインユーザーが自分のフォロー一覧画面を表示する場合
      # 現在フォローしているユーザー取得
      @followed_users = @user.followings
    else
      # ログインユーザーが他のユーザーのフォロー一覧画面を表示する場合
      # フォローしたことのある全てのユーザー取得
      follow = Follow.with_deleted.where(follower_id_id: current_user.id)
      followed_ids = follow.pluck(:following_id_id)
      @followed_users = User.where(id: followed_ids)
    end
  end
end
