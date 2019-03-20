class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :confirmable


  has_many :role_assignations
  has_many :roles, through: :role_assignations
  has_many :orders
  has_many :carts
  has_many :variants, through: :carts
  has_many :wishlists
  has_many :variants, through: :wishlists
  has_many :reviews
  has_many :likes
  has_many :comments
  has_many :posts
  has_many :posted_items, foreign_key: 'author_id', class_name: "Item"
  has_many :posted_articles, foreign_key: 'author_id', class_name: "Post"
  has_one_attached :avatar

  validates :firstname, :lastname, 
    presence: true, 
    length: { minimum: 3 }
  validates :username,
    presence: true, 
    uniqueness: true,
    length: { minimum: 3 },
    format: {with: /\A[a-zA-Z0-9_]{2,20}\z/ }  
  validates :age, 
    presence: true,
    numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :password, 
    presence: true, 
    length: { in: 6..20},
    confirmation: true,
    on: :create 
  validates :gender, 
    presence: true

  def fullname
    full_name = "#{self.firstname} #{self.lastname}"
    return full_name
  end

  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if username = conditions.delete(:username)
        where(conditions.to_hash).where("lower(username) = :value OR lower(email) = :value", value: username.downcase).first
      else
        where(conditions.to_hash).first
      end
    end
end