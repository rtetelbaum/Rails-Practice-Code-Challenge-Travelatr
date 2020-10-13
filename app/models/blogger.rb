class Blogger < ApplicationRecord
	has_many :posts
	has_many :destinations, through: :posts

	validates :name, uniqueness: true
	validates :age, numericality: { greater_than: 0 }
	validates :bio, length: { minimum: 30 }

	def post_likes
		likes = []
		self.posts.each do |post|
			likes << post.likes
		end
		likes.sum
	end
end
