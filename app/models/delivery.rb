class Delivery < ApplicationRecord
	has_many :orders
	
	validates_associated :orders
	validates :status,
    presence: true, 
    length: { minimum: 2, maximum: 30 }

end
