class Role < ApplicationRecord
	has_many :role_associations
	has_many :users, through: :role_associations
	
end
