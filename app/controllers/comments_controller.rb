class CommentsController < ApplicationController
  before_action :authenticate_user!
  
    def index
      
      @posts = current_user.posts
  
     
      @comments = current_user.comments
      

      @activities = (@posts + @comments).sort_by(&:created_at).reverse
    end

    def show
      @user = User.find(current_user.id)
      @comment = Comment.find(params[:id])
      @comments = @comment.replies.order(created_at: :desc)
    end

    def new
      @comment = Comment.new
    end


    def create
      @comment = current_user.comments.new(comment_params)
      @comment.post_id = params[:comment][:post_id]

      if @comment.save
        if @comment.parent
          redirect_to comment_path(@comment.parent.id)
        else
          redirect_to post_path(@comment.post_id)
        end
      else
        Rails.logger.error("Failed to save comment: #{@comment.errors.full_messages}")
        redirect_to comment_path(@comment.parent.id), notice: 'コメントの作成に失敗しました。'
      end

    end

    private

    def comment_params
      params.require(:comment).permit(:body,:post_id, :parent_id, :user_id)
    end


  end