class ChangeRecipesIngredientsColumnToArray < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :ingredients, :string, array: true, default: [], using: "(string_to_array(ingredients, ','))"
  end
end
