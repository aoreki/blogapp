class Relationship < ApplicationRecord
	# belongs_to :follower, class_name: "User"
	# belongs_to :following, class_name: "User",foreign_key:"followed_id"
	validates :follower_id, presence: true
	validates :followed_id, presence: true
end
