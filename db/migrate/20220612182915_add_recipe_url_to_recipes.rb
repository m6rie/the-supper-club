class AddRecipeUrlToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :recipe_url, :string
  end
end
