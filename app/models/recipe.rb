class Recipe < ApplicationRecord
validates :title, presence: true, length: { in: 2..40 }
validates :ingredients, presence: true, length: { in: 5..500 } 
validates :description, presence: true, length: { in: 5..500 }
#the owner
belongs_to :user
#the join table
has_many :recipe_users

has_many :users, through: :recipe_users
end
