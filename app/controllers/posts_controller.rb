class PostsController < ApplicationController
before_action :authenticate_user!
    def top
      @posts = Post.where(user_id: current_user.id)
    end

    def show
      @post = Post.find(params[:id])
      @user = User.find(current_user.id)
      @comment = @post.comments.order(created_at: :desc)
    end



    def create
      @post = current_user.posts.build(post_params)
  
      # フォームから送信された緯度・経度が空でない場合にはそれを使い、空の場合はIPアドレスから取得
      if @post.latitude.blank? || @post.longitude.blank?
        @post.geocode
      end
  
      if @post.save
        @post.update(map_image_url: generate_map_image_url(@post.latitude, @post.longitude))
        redirect_to root_path, notice: 'ツイートが投稿されました。'
      else
        flash.now[:alert] = 'ツイートの投稿に失敗しました。'
        render 'top'
      end
    end
    private
  
    def post_params
      params.require(:post).permit(:body, :latitude, :longitude)
    end
  
    def generate_map_image_url(latitude, longitude)
      api_key = ENV['GOOGLE_MAPS_STATIC_API_KEY']
      url = "https://maps.googleapis.com/maps/api/staticmap"
      url += "?center=#{latitude},#{longitude}"
      url += "&zoom=18"
      url += "&size=400x150"
      url += "&markers=color:red%7C#{latitude},#{longitude}"
      url += "&key=#{api_key}"
  
      url
    end
end
  