class AddDateToParties < ActiveRecord::Migration[7.0]
  def change
    add_column :parties, :date, :date
  end
end
