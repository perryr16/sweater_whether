class CreateDailies < ActiveRecord::Migration[5.2]
  def change
    create_table :dailies do |t|
      t.references :weather, foreign_key: true
      t.string :name
      t.string :summary
      t.string :precip
      t.string :high
      t.string :low

      t.timestamps
    end
  end
end
