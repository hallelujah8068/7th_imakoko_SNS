class PostsController < ApplicationController
    def index
      @posts = Post.where(user_id: current_user.id)
    end

    def show
      @post = Post.find(params[:id])
      @user = User.find(current_user.id)
      @comment = @post.comments.order(created_at: :desc)
      @users = current_user.following
    end



    private

  def post_params
    params.require(:post).permit(:body, :latitude,:longitude)
  end
end
