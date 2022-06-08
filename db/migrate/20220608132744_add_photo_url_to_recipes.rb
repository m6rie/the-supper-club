class AddPhotoUrlToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :photo_url, :string
  end
end
