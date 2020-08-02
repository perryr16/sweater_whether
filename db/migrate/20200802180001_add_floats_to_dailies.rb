class AddFloatsToDailies < ActiveRecord::Migration[5.2]
  def change
    add_column :dailies, :high, :float
    add_column :dailies, :low, :float
    add_column :dailies, :precip, :float
  end
end
