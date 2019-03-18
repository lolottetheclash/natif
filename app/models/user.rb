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
  has_one_attached :avatar

def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if username = conditions.delete(:username)
      where(conditions.to_hash).where("lower(username) = :value OR lower(email) = :value", value: username.downcase).first
    else
      where(conditions.to_hash).first
    end
  end

end