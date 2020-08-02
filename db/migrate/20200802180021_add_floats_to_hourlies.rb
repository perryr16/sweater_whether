class AddFloatsToHourlies < ActiveRecord::Migration[5.2]
  def change
    add_column :hourlies, :temp, :float
  end
end
