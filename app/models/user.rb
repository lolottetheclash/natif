class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :confirmable
  has_many :role_associations
  has_many :roles, through: :role_associations
  has_many :orders
  has_many :variants
  has_many :carts, through: :variants
  has_many :wishlists, through: :variants
  has_many :reviews
  has_many :likes
  has_many :comments
  has_many :posts
  has_many :posted_items, foreign_key: 'author_id', class_name: "Item"
  has_many :posted_articles, foreign_key: 'author_id', class_name: "Post"

  def role
    #user_role = RoleAssignation.all
    #user_role.each do |stuff|
    #stuff.role_id
    #end
  end

end