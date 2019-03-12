class Role < ApplicationRecord
	has_many :roleassociations
	has_many :users, through: :roleassociations
	
end
