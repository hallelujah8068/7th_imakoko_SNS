class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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

  #ユーザーアイコンをuser_iconとしてモデルに紐付け
  has_one_attached :user_icon
  has_many :posts
  has_many :comments
  # ユーザーがフォローしているユーザー
  has_many :active_relationships, class_name: "Follow", foreign_key: "follower_id_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :following
  # ユーザーをフォローしているユーザー 
  has_many :passive_relationships, class_name: "Follow", foreign_key: "following_id_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

   # 指定したユーザーをフォローする
  def follow(user)
    active_relationships.create(following_id_id: user.id)
  end
  
  # 指定したユーザーのフォローを解除する
  def unfollow(user)
    active_relationships.find_by(following_id_id: user.id).destroy
  end
  
  # 指定したユーザーをフォローしているかどうかを判定
  def following?(user)
    following.include?(user)
  end
end
