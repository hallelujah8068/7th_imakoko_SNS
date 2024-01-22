class UsersController < ApplicationController
  before_action :authenticate_user!

  def top
    binding.pry
    @user = current_user
  end

  

end
