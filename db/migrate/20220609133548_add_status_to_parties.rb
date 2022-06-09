class AddStatusToParties < ActiveRecord::Migration[7.0]
  def change
    add_column :parties, :status, :string, default: "pending"
  end
end
