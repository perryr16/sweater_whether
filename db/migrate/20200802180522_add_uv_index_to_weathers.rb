class AddUvIndexToWeathers < ActiveRecord::Migration[5.2]
  def change
    add_column :weathers, :uv_index, :float
  end
end
