class Option < ApplicationRecord
  has_many :option_values
	
  validates :name,
    presence: true, 
    length: { minimum: 2, maximum: 20 }
end
