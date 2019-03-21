class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true 
  has_many :comments, as: :commentable
	
  validates :title,
    presence: true, 
    length: { minimum: 2, maximum: 20 }
  validates :content,
    presence: true, 
    length: { minimum: 20, maximum: 150 }
end
