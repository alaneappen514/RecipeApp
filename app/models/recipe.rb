class Recipe < ApplicationRecord
validates :title, presence: true, length: { in: 2..40 }
validates :ingredients, presence: true, length: { in: 5..150 } 
validates :description, presence: true, length: { in: 5..200 }
belongs_to :user
end