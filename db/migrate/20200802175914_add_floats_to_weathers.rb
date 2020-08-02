class AddFloatsToWeathers < ActiveRecord::Migration[5.2]
  def change
    add_column :weathers, :high, :float
    add_column :weathers, :low, :float
    add_column :weathers, :feels_like, :float
    add_column :weathers, :humidity, :float
    add_column :weathers, :visibility, :float
    add_column :weathers, :temp, :float
  end
end
