class Post < ApplicationRecord
	belongs_to :author, class_name: "User"
	belongs_to :theme

	has_many :likes
	has_many :comments, as: :commentable
	
  has_many :tag_items, as: :taggable
  has_many :tags, through: :tag_items, as: :taggable
end
