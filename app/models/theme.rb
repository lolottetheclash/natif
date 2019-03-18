class Theme < ApplicationRecord
	has_many :posts

	validates_associated :posts
	validates :name,
    presence: true, 
    length: { minimum: 2, maximum: 30 }
    

end
