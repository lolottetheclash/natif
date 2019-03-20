class Delivery < ApplicationRecord
	has_many :orders
	
	validates :status,
    presence: true, 
    length: { minimum: 2, maximum: 30 }

end
