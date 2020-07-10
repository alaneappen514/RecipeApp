class Api::V1::RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
        render json: RecipeSerializer.new(@recipes).serializable_hash
    end

    def show
        @recipes = Recipe.find(params[:id])
        render json: RecipeSerializer.new(@recipes).serializable_hash
    end
end
