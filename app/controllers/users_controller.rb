class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @posts = current_user.posts
    @comments = current_user.comments
    @activities = (@posts + @comments).sort_by(&:created_at).reverse
  end



  private

  def user_params
    params.require(:user).permit(:email, password_digest,:name,:user_name,:description)
  end


  
end
