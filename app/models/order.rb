class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery
  has_many :carts

  validates :address, 
    presence: true
  validates :zipcode,
  	presence:true,
  	format: { with: /\A[a-zA-Z0-9_\-]+\z/ }
  validates :stripe_id,
    presence:true
end
