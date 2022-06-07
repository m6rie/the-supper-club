class CreatePartyDates < ActiveRecord::Migration[7.0]
  def change
    create_table :party_dates do |t|
      t.integer :date
      t.string :votes

      t.timestamps
    end
  end
end
