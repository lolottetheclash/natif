class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :rating,
    presence: true, 
    numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :title,
    presence: true, 
    length: { minimum: 2, maximum: 20 }
  validates :content,
    presence: true, 
    length: { minimum: 20, maximum: 80 }

end
