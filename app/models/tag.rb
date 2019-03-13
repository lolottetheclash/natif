class Tag < ApplicationRecord
	has_many :tag_items
	has_many :variants, through: :tag_items
	has_many :posts, through: :tag_items
	has_many :items, through: :tag_items
end
