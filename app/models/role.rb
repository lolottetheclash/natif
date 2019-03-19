class Role < ApplicationRecord
	has_many :role_assignations
	has_many :users, through: :role_assignations

	validates :name,
    presence: true, 
    length: { minimum: 2, maximum: 30 }
    validates :description,
    presence: true, 
    length: { minimum: 20, maximum: 150 }	
end
