class AddQrurlColumnToParties < ActiveRecord::Migration[7.0]
  def change
    add_column :parties, :qrcode, :string
  end
end
