class OptionValue < ApplicationRecord
  belongs_to :option
  has_many :option_associations
  
  validates_associated :option_values

  validates :name,
    presence: true, 
    length: { minimum: 2, maximum: 20 }

end
