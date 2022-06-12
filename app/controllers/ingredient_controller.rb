class IngredientController < ApplicationController

  def show
    @party = Party.find(params[:party_id])
    @party_recipe = @party.recipes
    @party_recipe.each do |recipe|
    @ingredients = recipe.ingredients
  end
  end
end
