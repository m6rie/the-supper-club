class AddAttendancyToParties < ActiveRecord::Migration[7.0]
  def change
    add_column :parties, :attendancy, :integer
  end
end
