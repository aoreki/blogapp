class User < ApplicationRecord
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: {maximum:255}, uniqueness: true
	validates :email, presence: true, format: {with: /.+@.+/}, uniqueness: { case_sensitive: false }
	has_secure_password
end
