class DropPartyDates < ActiveRecord::Migration[7.0]
  def change
    drop_table :party_dates
  end
end
