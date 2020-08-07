class Recipe < ApplicationRecord
validates :title, presence: true, length: { in: 2..40 }
validates :ingredients, presence: true, length: { in: 5..500 } 
validates :description, presence: true, length: { in: 5..500 }
#the owner
belongs_to :user

has_many :recipe_users
has_many :users, through: :recipe_users

has_many :collaborations
has_many :users, through: :collaborations

has_one_attached :image
end
