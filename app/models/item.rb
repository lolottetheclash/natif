class Item < ApplicationRecord
  belongs_to :category
	belongs_to :author, class_name: "User"
	
  has_many :reviews
  has_many :variants

  has_many :tag_items, as: :taggable
  has_many :tags, through: :tag_items, as: :taggable

end