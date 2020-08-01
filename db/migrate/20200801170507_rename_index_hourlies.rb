class RenameIndexHourlies < ActiveRecord::Migration[5.2]
  def change
    rename_column :hourlies, :Index, :index
  end
end
