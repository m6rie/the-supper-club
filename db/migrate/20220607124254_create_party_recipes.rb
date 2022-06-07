class CreatePartyRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :party_recipes do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
