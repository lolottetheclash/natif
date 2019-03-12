class Tag < ApplicationRecord
	has_many :targets, :through => :tag_item
end
