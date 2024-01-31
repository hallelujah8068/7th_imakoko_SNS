class FollowsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @user = User.find(params[:id])
      @following_users = @user.followings
    end
  
    
  end