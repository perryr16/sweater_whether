class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :summary
      t.string :difficulty
      t.string :location
      t.string :distance_to_trail

      t.timestamps
    end
  end
end
