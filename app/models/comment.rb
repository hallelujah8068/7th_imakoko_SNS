class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    belongs_to :parent, class_name: 'Comment', optional: true
    has_many :replies, class_name: 'Comment', foreign_key: 'parent_id'
    #いいねモデル
    has_many :likes, dependent: :destroy
    #「いいね」に、ログインしているユーザが含まれているか
    def liked_by?(user)
        likes.exists?(user_id: user.id)
    end
    validates :body, presence: true, length: { minimum: 1 }
end
