class LikesController < ApplicationController
    before_action :authenticate_user! # ログインしているかどうかを確認するためのDeviseのメソッド
  
    def create
      if params[:post_id]
        @post = Post.find(params[:post_id])
        current_user.likes.create!(post: @post)
        redirect_back fallback_location: root_path
      elsif params[:comment_id]
        @comment = Comment.find(params[:comment_id])
        current_user.likes.create(comment: @comment)
        redirect_to @comment.present? ? @comment.post : root_path
      end
    end
    
      def destroy
        if params[:post_id]
          @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id], comment_id: nil)
          @like.destroy
          redirect_back fallback_location: root_path
        elsif params[:comment_id] && params[:id]
          @like = Like.find_by(comment_id: params[:comment_id])
          @like.destroy
          redirect_back fallback_location: root_path
        end
      end
  end