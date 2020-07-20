class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes

  #join table
  has_many :recipe_users

  has_many :recipe_collabs, through: :recipe_users, source: :recipe
  

  def username
     return self.email.split('@')[0].capitalize
  end
end

