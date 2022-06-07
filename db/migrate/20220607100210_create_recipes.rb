class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :prep_time
      t.string :ingredients
      t.text :instructions

      t.timestamps
    end
  end
end
