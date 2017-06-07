class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one :source, class_name: 'Micropost', primary_key: 'source_id', foreign_key: 'id'
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
end
