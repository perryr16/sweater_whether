class RemoveTimeFromWeather < ActiveRecord::Migration[5.2]
  def change
    remove_column :weathers, :time, :string
  end
end
