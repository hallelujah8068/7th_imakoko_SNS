class FollowersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
    @followers = @user.followers
    @following = @user.following
  end

end