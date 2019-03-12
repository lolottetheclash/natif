class Variant < ApplicationRecord
  belongs_to :item
  has_many :wishlists
  has_many :option_associations
  has_many :option_values, through: :option_associations

  has_many :tags, :through => :tag_item, :as => :target

end
