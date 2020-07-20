class Api::V1::RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
        render json: RecipeSerializer.new(@recipes).serializable_hash
    end

    def show
        @recipe = Recipe.find(params[:id])
        render json: RecipeSerializer.new(@recipe).serializable_hash
    end

    def create
        byebug
        @recipe = Recipe.create!(params.permit(:title, :ingredients, :description, :user_id ))
        render json: RecipeSerializer.new(@recipe).serializable_hash
    rescue => e
        render json: { error: e.message }, status: 422
    end

    def update
     
       @recipe = Recipe.update(params.permit(:title, :ingredients, :description,  :user_id ))
       render json: RecipeSerializer.new(@recipe).serializable_hash
    end
end
