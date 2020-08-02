class AddUvratingToWeathers < ActiveRecord::Migration[5.2]
  def change
    add_column :weathers, :uv_index_rating, :string
  end
end
