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
<<<<<<< HEAD
=======

>>>>>>> 7949f11 (add:post機能)
end
