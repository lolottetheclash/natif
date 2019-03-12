class Item < ApplicationRecord
  belongs_to :category

  has_many :reviews
  has_many :variants

  has_many :tag_items, as: :taggable
  has_many :tags, through: :tag_items, as: :taggable

end