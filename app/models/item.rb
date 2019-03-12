class Item < ApplicationRecord
  belongs_to :category

  has_many :carts
  has_many :reviews
  has_many :wishlists
  has_many :variants

end