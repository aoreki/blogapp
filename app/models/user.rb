class User < ApplicationRecord
	#虚拟属性，随机令牌
	attr_accessor :remember_token
	has_many :microposts,dependent: :destroy
	# has_many :active_relationships, class_name: "Relationship",foreign_key: "follower_id",
	# 	dependent: :destroy
	# has_many :passive_relationships, class_name: "Relationship",foreign_key: "followed_id",
	# 	dependent: :destroy
	# has_many :following, through: :active_relationships
	# has_many :follower, through: :passive_relationships, source: :follower
	has_and_belongs_to_many :followers,class_name: "User",join_table:"relationships",
		foreign_key: "followed_id",association_foreign_key: "follower_id"
	has_and_belongs_to_many :followings,class_name: "User",join_table:"relationships",
		foreign_key: "follower_id",association_foreign_key: "followed_id"

	before_save { self.email = email.downcase }
	validates :name, presence: true, length: {maximum:255}, uniqueness: true
	validates :email, presence: true, format: {with: /.+@.+/}, 
		uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 },allow_nil:{on: :update}
	has_secure_password
	# 返回指定字符串的哈希摘要
	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
	# 返回一个随机令牌
	def self.new_token
		SecureRandom.urlsafe_base64
	end
  #用户的令牌hash存入数据库
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	# def followings
	# 	User.find_by_sql(["SELECT users.* from users INNER JOIN relationships ON users.id=relationships.followed_id WHERE relationships.follower_id = ?",id])
	# end

	# def followers
	# 	User.find_by_sql(["SELECT users.* from users INNER JOIN relationships ON users.id=relationships.follower_id WHERE relationships.followed_id = ?",id])
	# end
end
