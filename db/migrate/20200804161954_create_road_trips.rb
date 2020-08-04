class CreateRoadTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :road_trips do |t|
      t.string :origin
      t.string :destination
      t.string :travel_time
      t.string :arrival_temp
      t.string :arrival_summary
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
