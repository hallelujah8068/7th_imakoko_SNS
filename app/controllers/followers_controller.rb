class FollowersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
    @followers = @user.followers
    @following = @user.following

    puts "@followers: #{@followers.inspect}"
    puts "@following: #{@following.inspect}"
  end

  def followings
    @user = User.find(params[:id])
    @following_users = @user.followings
  end

  def followers
    
  end

end