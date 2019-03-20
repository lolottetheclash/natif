class OptionValue < ApplicationRecord
  belongs_to :option
  has_many :option_associations
  
  validates :name,
    presence: true, 
    length: { minimum: 2, maximum: 20 }

end
