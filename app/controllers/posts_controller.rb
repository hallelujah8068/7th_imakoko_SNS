class PostsController < ApplicationController
    def index
      @posts = Post.where(user_id: current_user.id)
    end


    private

  def post_params
    params.require(:post).permit(:body, :latitude,:longitude)
  end
end
