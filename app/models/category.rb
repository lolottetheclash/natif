class Category < ApplicationRecord
	has_many :items
	
	validates_associated :items
	validates :name,
    presence: true, 
    length: { minimum: 2, maximum: 20 }
end
