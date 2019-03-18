class Variant < ApplicationRecord
  belongs_to :item

  has_many :wishlists
  has_many :users, through: :wishlists

  has_many :carts
  has_many :users, through: :carts  

  has_many :option_associations
  has_many :option_values, through: :option_associations

  has_many :tag_items, as: :taggable
  has_many :tags, through: :tag_items, as: :taggable


  validates_associated :wishlists
  validates_associated :carts
  validates_associated :option_associations
  validates_associated :tag_items


  validates :title,
    presence: true, 
    length: { minimum: 2, maximum: 30 }
    
  validates :price,
    presence: true,
    format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }
 
  validates :stock,
    presence: true, 
    numericality: { only_integer: true }

end
