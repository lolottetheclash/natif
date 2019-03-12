class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery
  has_many :carts
end
