class RemoveRoadTripColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :road_trips, :travel_time
    remove_column :road_trips, :arrival_temp
  end
end
