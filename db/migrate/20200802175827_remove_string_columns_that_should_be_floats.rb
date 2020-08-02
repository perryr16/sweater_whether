class RemoveStringColumnsThatShouldBeFloats < ActiveRecord::Migration[5.2]
  def change
    remove_column :weathers, :high
    remove_column :weathers, :low
    remove_column :weathers, :feels_like
    remove_column :weathers, :humidity
    remove_column :weathers, :visibility
    remove_column :weathers, :temp
    remove_column :hourlies, :temp
    remove_column :dailies, :high
    remove_column :dailies, :low
    remove_column :dailies, :precip
  end
end
