class AddDishesAndNumberOfDishesToParties < ActiveRecord::Migration[7.0]
  def change
    add_column :parties, :appetizers, :integer
    add_column :parties, :mains, :integer
    add_column :parties, :desserts, :integer
  end
end
