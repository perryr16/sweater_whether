class AddUnitsToDailies < ActiveRecord::Migration[5.2]
  def change
    add_column :dailies, :temp_units, :string
    add_column :dailies, :precip_units, :string
  end
end
