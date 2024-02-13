class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_to_follow, only: [:follow, :unfollow]

  def index
    @user = User.find(current_user.id)
    @users = current_user.following
    @posts = @user.posts
    @comments = @user.comments
    @activities = (@posts + @comments).sort_by(&:created_at).reverse
  end


  def show
    @user = User.find(params[:id])
    # サイドバーからのツイート機能
    @post_new =Post.new
    @posts = @user.posts.reverse
    @comments = @user.comments
    @activities = (@posts + @comments).sort_by(&:created_at).reverse
  end

  def follow
    current_user.follow(@user_to_follow)
    # redirect_to user_path(@user_to_follow) user_pathにリダイレクトすると、フォロワー一覧画面からフォローした際に画面が遷移してしまうため元の画面に戻すように変更
    redirect_back(fallback_location: user_path(@user_to_follow))
  end

  def unfollow
    current_user.unfollow(@user_to_follow)
    # redirect_to user_path(@user_to_follow)　上に同じ
    redirect_back(fallback_location: user_path(@user_to_follow))
  end



  private

  def user_params
    params.require(:user).permit(:email, password_digest,:name,:user_name,:description)
  end








  
  def set_user_to_follow
    @user_to_follow = User.find(params[:id])
  end
end
