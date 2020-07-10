class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :ingredients, :description
  belongs_to :user
end
