class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.string :title
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
