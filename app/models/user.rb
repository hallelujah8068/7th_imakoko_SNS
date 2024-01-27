class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login] 
  
  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["user_name = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  has_one_attached :user_icon
  has_many :posts

  has_many :follower_relationships, foreign_key: "following_id_id", class_name: "Follow"
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: "follower_id_id", class_name: "Follow"
  has_many :following, through: :following_relationships, source: :following
  has_many :comments
end