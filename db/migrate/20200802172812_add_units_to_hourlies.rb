class AddUnitsToHourlies < ActiveRecord::Migration[5.2]
  def change
    add_column :hourlies, :temp_units, :string
  end
end
