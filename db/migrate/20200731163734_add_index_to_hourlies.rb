class AddIndexToHourlies < ActiveRecord::Migration[5.2]
  def change
    add_column :hourlies, :Index, :integer
  end
end
