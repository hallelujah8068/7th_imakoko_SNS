class FollowsController < ApplicationController
    before_action :authenticate_user!
  
    def followings
      @user = User.find(params[:id])
      @following_users = @user.followings
    end
  
    def followers
      
    end
  end