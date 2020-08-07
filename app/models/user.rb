class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes
  #Favorites#
  has_many :recipe_users
  has_many :saved_recipes, through: :recipe_users, source: :recipe

  has_many :collaborations
  has_many :shared_recipes, through: :collaborations, source: :recipe
  

  scope :all_except, -> (user){where.not(id:user)}
  scope :exclude_collaborators, -> (recipe){where.not(id: recipe.users)}
  
  def username
     return self.email.split('@')[0].capitalize
  end
end

