class CommentsController < ApplicationController
    def index
      
      @posts = current_user.posts
  
     
      @comments = current_user.comments

      @activities = (@posts + @comments).sort_by(&:created_at).reverse
    end
  end