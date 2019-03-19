class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :variant


  validates :user,
    presence: true
  validates :variant,
    presence: true

end
