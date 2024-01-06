class PostsController < ApplicationController
  before_action :authenticate_user!

  def top
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
    @user = @post.user
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = '投稿が成功しました'
    else
      flash[:error] = '投稿に失敗しました'
      puts @post.errors.full_messages
    end

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

end
