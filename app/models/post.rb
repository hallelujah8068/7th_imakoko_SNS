class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, class_name: 'Comment' # :class_nameオプションを追加
  validates :body, presence: true, length: { minimum: 1, maximum: 140 }

  #いいねモデル
  has_many :likes, dependent: :destroy

  #「いいね」に、ログインしているユーザが含まれているか
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  geocoded_by :ip_address,
    :latitude => :latitude, :longitude => :longitude

  after_validation :geocode
  # before_validation :geocode


  attr_accessor :map_image_url

  def ip_address
    if defined?(request)
      request.remote_ip
    else
      ENV['REMOTE_ADDR']
    end
  end

  def map_image_url
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

