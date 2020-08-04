class AddTempTimeToRoadTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :road_trips, :arrival_temp, :float
    add_column :road_trips, :travel_time, :float
  end
end
