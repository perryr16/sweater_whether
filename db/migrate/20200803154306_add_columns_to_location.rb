class AddColumnsToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :forecast_summary, :string
    add_column :locations, :forecast_temp, :string
  end
end
