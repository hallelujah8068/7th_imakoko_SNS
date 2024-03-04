class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    belongs_to :parent, class_name: 'Comment', optional: true
    has_many :replies, class_name: 'Comment', foreign_key: 'parent_id'
    validates :body, presence: true, length: { minimum: 1 }
end
