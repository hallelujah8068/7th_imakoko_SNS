class LikesController < ApplicationController
    before_action :authenticate_user! # ログインしているかどうかを確認するためのDeviseのメソッド
  
    def create
      if params[:post_id]
        @post = Post.find(params[:post_id])
        current_user.likes.create!(post: @post)
        redirect_to @post
      elsif params[:comment_id]
        @comment = Comment.find_by(id: params[:comment_id])
        current_user.likes.create(comment: @comment)
        redirect_to @comment.present? ? @comment.post : root_path
      end
    end
    
      def destroy
        @like = Like.find(params[:id])
        @like.destroy if @like.user == current_user
        redirect_back fallback_location: root_path
      end
  end