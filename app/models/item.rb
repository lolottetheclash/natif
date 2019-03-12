class Item < ApplicationRecord
  belongs_to :category

  has_many :reviews
  has_many :variants

  has_many :tags, :through => :tag_item, :as => :target

end