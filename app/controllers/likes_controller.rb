class LikesController < ApplicationController
    before_action :authenticate_user! # ログインしているかどうかを確認するためのDeviseのメソッド
  
    def create
      if params[:post_id]
        post = Post.find(params[:post_id])
        like = current_user.likes.new(post_id: post.id)
        like.save
        render turbo_stream: turbo_stream.replace("post_#{post.id}-likes",partial: 'likes/likes_btn',locals: { post: post },)
      else
        comment = Comment.find(params[:comment_id])
        like = current_user.likes.new(comment_id: comment.id)
        like.save
        render turbo_stream: turbo_stream.replace("comment_#{comment.id}-likes", partial: 'likes/comments_likes_btn', locals: { comment: comment })
      end
    end
    
    def destroy
      if params[:post_id]
        post = Post.find(params[:post_id])
        like = current_user.likes.find_by(post_id: post.id)
        like.destroy
        render turbo_stream: turbo_stream.replace("post_#{post.id}-likes",partial: 'likes/likes_btn',locals: { post: post },)
      else
        comment = Comment.find(params[:comment_id])
        like = current_user.likes.find_by(comment_id: comment.id)
        like.destroy
        render turbo_stream: turbo_stream.replace("comment_#{comment.id}-likes", partial: 'likes/comments_likes_btn', locals: { comment: comment })
      end
    end

  end