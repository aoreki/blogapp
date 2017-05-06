class User < ApplicationRecord
	#虚拟属性，随机令牌
	attr_accessor :remember_token
	has_many :microposts,dependent: :destroy

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
end
