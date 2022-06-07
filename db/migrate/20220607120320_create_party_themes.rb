class CreatePartyThemes < ActiveRecord::Migration[7.0]
  def change
    create_table :party_themes do |t|
      t.references :theme, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
