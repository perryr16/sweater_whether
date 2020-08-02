class RemoveUvIndexFromWeathers < ActiveRecord::Migration[5.2]
  def change
    remove_column :weathers, :uv_index
  end
end
