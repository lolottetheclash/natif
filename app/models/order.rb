class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery
  has_many :carts

  validates_associated :carts



  validates :address, 
    presence: true
  

end
