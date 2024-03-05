class PostsController < ApplicationController
before_action :authenticate_user!
    def top
      @posts = Post.all.order(created_at: :desc).limit(30)
      # ツイート作成
      @post_new =Post.new
      @user = @post_new.user
    end

    #TOP画面で100件のツイートを取得を押すと以下アクションで変数を再設定
    def load_more
      @posts = Post.all.order(created_at: :desc).limit(100)
      # ツイート作成
      @post_new =Post.new
      @user = @post_new.user
    end

    # 全てのツイートを取得
    def load_max 
      @posts = Post.all.order(created_at: :desc)
      @post_new =Post.new
      @user = @post_new.user
    end
    

    def show
      @post = Post.find(params[:id])
      @post_new =Post.new
      @user = User.find(current_user.id)
      @comments = @post.comments.order(created_at: :desc)
      @users = current_user.following
    end



    def create
      @post = current_user.posts.build(post_params)
  
      # # フォームから送信された緯度・経度が空でない場合にはそれを使い、空の場合はIPアドレスから取得
      # if @post.latitude.blank? || @post.longitude.blank?
      #   @post.geocode
      # end
  
      if @post.save
        @post.update(map_image_url: generate_map_image_url(@post.latitude, @post.longitude))
        redirect_to root_path
      else
        flash[:alert] = "ツイートの投稿に失敗しました"
        redirect_to root_path
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

