class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :remember_token

  has_many :microposts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :followers, class_name: 'User', join_table: 'relationships',
                                      foreign_key: 'followed_id', association_foreign_key: 'follower_id'
  has_and_belongs_to_many :followings, class_name: 'User', join_table: 'relationships',
                                       foreign_key: 'follower_id', association_foreign_key: 'followed_id'

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :email, presence: true, format: { with: /.+@.+/ },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, allow_nil: { on: :update }
  # has_secure_password

  def self.digest(string)
    cost =
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
