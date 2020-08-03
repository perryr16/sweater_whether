class CreateLocationTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :location_trails do |t|
      t.references :location, foreign_key: true
      t.references :trail, foreign_key: true

      t.timestamps
    end
  end
end
