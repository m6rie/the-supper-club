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

  # def add_favorites
  #   @recipes = Recipe.find(params)
  #   UserRecipe.create(user_id: current_user.id, recipe_id: @recipe.id )
  # end

  # link_to add_favorite_path, params(@recipe.id) do
  #   <i class="fa-thin fa-heart"></i>
  # end
  # end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:tile, :description, :prep_time, :ingredients, :instructions)
  end
end
