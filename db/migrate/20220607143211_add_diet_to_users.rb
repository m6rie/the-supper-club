class AddDietToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :diet, :string
  end
end
