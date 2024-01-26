class UsersController < ApplicationController
  before_action :authenticate_user!

  def top
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:email, password_digest,:name,:user_name,:description)
  end

  
end
