class Cart < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :variant
  belongs_to :user

  validates :quantity,
    presence: true, 
    numericality: { only_integer: true, greater_than: 0 }

  def total_per_item
		return self.quantity.to_f * Variant.find_by_id(self.variant_id).price.to_f
	end

end
