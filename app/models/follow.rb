class Follow < ApplicationRecord
    belongs_to :follower, class_name: "User", foreign_key: "follower_id_id"
    belongs_to :following, class_name: "User", foreign_key: "following_id_id"
    acts_as_paranoid
end
