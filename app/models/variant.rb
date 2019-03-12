class Variant < ApplicationRecord
  belongs_to :item
  has_many :wishlists
  has_many :option_associations
  has_many :option_values, through: :option_associations

end
