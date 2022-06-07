class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]

  def show
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
