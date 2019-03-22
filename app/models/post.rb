class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :theme
	
  has_many :likes
  has_many :comments, as: :commentable
  has_many :tag_items, as: :taggable
  has_many :tags, through: :tag_items, as: :taggable
	
  validates :title,
    presence: true, 
    length: { minimum: 2, maximum: 50 }
  validates :content,
    presence: true, 
    length: { minimum: 20, maximum: 2000 }
  
  paginates_per 6

  has_one_attached :image_post

end
