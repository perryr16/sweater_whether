class AddTempToWeathers < ActiveRecord::Migration[5.2]
  def change
    add_column :weathers, :temp, :string
  end
end
