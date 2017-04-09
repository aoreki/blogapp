class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true,length: { minimum: 5 }
	after_initialize {p 'you have create an article'}
end


