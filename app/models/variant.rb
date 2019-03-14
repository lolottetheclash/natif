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
end
