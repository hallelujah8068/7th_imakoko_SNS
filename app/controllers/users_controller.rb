class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    # @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
    @activities = (@posts + @comments).sort_by(&:created_at).reverse
  end

  def follow
    @user_to_follow = User.find(params[:id])
    current_user.follow(@user_to_follow)

    redirect_to root_path, notice: 'ユーザーをフォローしました'
  end

  def unfollow
    @user_to_unfollow = User.find(params[:id])
    current_user.unfollow(@user_to_unfollow)

    redirect_to root_path, notice: 'ユーザーのフォローを解除しました'
  end



  private

  def user_params
    params.require(:user).permit(:email, password_digest,:name,:user_name,:description)
  end


end
