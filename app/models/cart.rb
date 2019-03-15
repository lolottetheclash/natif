class Cart < ApplicationRecord
  belongs_to :order
  belongs_to :variant
  belongs_to :user

  def total_per_item
		return self.quantity.to_f * Variant.find_by_id(self.variant_id).price.to_f
	end

end
