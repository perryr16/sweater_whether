class AddUnitsToWeathers < ActiveRecord::Migration[5.2]
  def change
    add_column :weathers, :temp_units, :string
    add_column :weathers, :visibility_units, :string
    add_column :weathers, :humidity_units, :string
  end
end
