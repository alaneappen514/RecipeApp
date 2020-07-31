class RecipeUsersController < ApplicationController
  def update
    favorite = RecipeUser.where(recipe: Recipe.find(params[:recipe]), user: current_user)
    if favorite == []
      RecipeUser.create(recipe: Recipe.find(params[:recipe]), user: current_user)
      @favorite_exists = true
    else
       favorite.destroy_all
       @favorite_exists = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
