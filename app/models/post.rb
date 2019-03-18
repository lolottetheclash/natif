class Post < ApplicationRecord
	belongs_to :author, class_name: "User"
	belongs_to :theme
	has_many :likes
	has_many :comments, as: :commentable
	has_many :tag_items, as: :taggable
	has_many :tags, through: :tag_items, as: :taggable

	validates_associated :likes
	validates_associated :comments
	validates_associated :tag_items
	validates :title,
    presence: true, 
    length: { minimum: 2, maximum: 50 }
    validates :content,
    presence: true, 
    length: { minimum: 20, maximum: 2000 }




end
