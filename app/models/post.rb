class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :body, presence: true

  geocoded_by :ip_address,
    :latitude => :latitude, :longitude => :longitude

  after_validation :geocode

  attr_accessor :map_image_url

  def ip_address
    request.remote_ip if defined?(request)
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

