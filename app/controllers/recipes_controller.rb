class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]

  def index
    if params[:query].present?
      # @recipes = Recipe.where(title: params[:query])
      @recipes = Recipe.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @recipes = Recipe.all
    end
  end

  def my_recipes
    @my_recipes = UserRecipe.where(user_id: current_user.id)
  end

  def show
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:tile, :description, :prep_time, :ingredients, :instructions)
  end
end
