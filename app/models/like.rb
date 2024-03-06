class Like < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :post, optional: true
    belongs_to :comment, optional: true

    #validates_uniqueness_of :post_id, scope: :user_id,
    #validates_uniqueness_of :comment_id, scope: :user_id
end
