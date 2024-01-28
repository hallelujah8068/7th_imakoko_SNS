class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_to_follow, only: [:follow, :unfollow]

  def top
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end


  def show
    @user = User.find(params[:id])
    
    @posts = @user.posts
    @comments = @user.comments
    @activities = (@posts + @comments).sort_by(&:created_at).reverse
  end



  def follow
    current_user.follow(@user_to_follow)
    redirect_to user_path(@user_to_follow)
  end

  def unfollow
    current_user.unfollow(@user_to_follow)
    redirect_to user_path(@user_to_follow)
  end



  private

  def user_params
    params.require(:user).permit(:email, password_digest,:name,:user_name,:description)
  end








  
  def set_user_to_follow
    @user_to_follow = User.find(params[:id])
  end
end
