class DropPartyThemes < ActiveRecord::Migration[7.0]
  def change
    drop_table :party_themes
  end
end
