class Recipe < ApplicationRecord
    validates_presence_of :title, :ingredients, :description
    validates :title, length: {maximum: 40}
    belongs_to :user
end
