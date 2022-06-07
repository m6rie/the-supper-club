class CreatePartyDates < ActiveRecord::Migration[7.0]
  def change
    create_table :party_dates do |t|
      t.date :date
      t.string :votes
      t.references :parties, null: false, foreign_key: true
      t.timestamps
    end
  end
end
