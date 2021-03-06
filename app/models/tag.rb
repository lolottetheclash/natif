class Tag < ApplicationRecord
  has_many :tag_items
  has_many :variants, through: :tag_items
  has_many :posts, through: :tag_items
  has_many :items, through: :tag_items

  validates :name,
    presence: true,
    uniqueness: true,
    length: { minimum: 2, maximum: 20 }
end



