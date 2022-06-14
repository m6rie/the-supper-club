class RemoveInstructionsFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :instructions, :string
  end
end
