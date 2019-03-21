class Search < ApplicationRecord
  def search_elements
    variants = Variant.all
    variants = Variant.where(["price >= ?", min_price]) if min_price.present?
    variants = Variant.where(["price <= ?", max_price]) if max_price.present?
    variants = Variant.where(["price <= ?", max_price]).where(["price >= ?", min_price]) if max_price.present? && min_price.present?
    return variants  
  end
end
