class Item < ApplicationRecord
  belongs_to :category

  has_many :reviews
  has_many :variants

end