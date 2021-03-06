class Item < ApplicationRecord
  belongs_to :category
	belongs_to :author, class_name: "User"
	
  has_many :reviews
  has_many :variants

  has_many :tag_items, as: :taggable
  has_many :tags, through: :tag_items, as: :taggable

  has_one_attached :image_item

  validates :title,
    presence: true, 
    length: { minimum: 2, maximum: 30 }
  validates :description,
    presence: true, 
    length: { minimum: 20, maximum: 200 }

  def review_average
	  rating = 0
	  if not Review.where(item_id: self.id).empty?
	    rating = Review.where(item_id: self.id).map(&:rating).instance_eval { reduce(:+) / size.to_f }
	  end 
	  return rating
  end
end