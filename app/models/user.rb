class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :confirmable

  has_many :role_associations
  has_many :roles, through: :role_associations

  has_many :orders
  has_many :carts
  has_many :reviews
  has_many :wishlists
  has_many :likes
  has_many :comments

end