class Post < ApplicationRecord
	belongs_to :user
	belongs_to :theme
	has_many :comments
	has_many :likes
	has_many :users, through: :likes
	has_many :comments,as: :commentable
	has_many :tagitems,as: :tagable
end
