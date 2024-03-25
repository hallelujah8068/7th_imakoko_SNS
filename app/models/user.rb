class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         authentication_keys: [:login] 
  
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name, presence: true, length: { in: 1..50 }
  validates :user_name, presence: true, uniqueness: true, length: { in: 5..15 }, format: { with: /\A[\w]+\z/, message: "は英数字とアンダースコアのみ使用できます" }
  validate :validate_user_icon_size
  validates :password, presence: true, length: { minimum: 6 }


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

  # ユーザーがフォローしているユーザー
  has_many :active_relationships, class_name: "Follow", foreign_key: "follower_id_id", dependent: :destroy
  has_many :followings, through: :active_relationships

  # ユーザーをフォローしているユーザー
  has_many :passive_relationships, class_name: "Follow", foreign_key: "following_id_id", dependent: :destroy
  has_many :followers, through: :passive_relationships

  #いいねモデル
  has_many :likes, dependent: :destroy

  def follow(user)
    active_relationships.create(following_id_id: user.id)
  end

  # ユーザーのフォローを解除するメソッド
  def unfollow(user)
    active_relationships.find_by(following_id_id: user.id).destroy
  end

  #ユーザーがドローしているユーザー
  def following?(user)
    followings.include?(user)
  end

  private

  def validate_user_icon_size
    if user_icon.attached? && user_icon.blob.byte_size > 10.megabytes
      errors.add(:user_icon, "には10MB以下の画像を選択してください")
    end
  end
end