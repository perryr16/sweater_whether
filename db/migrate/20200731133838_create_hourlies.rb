class CreateHourlies < ActiveRecord::Migration[5.2]
  def change
    create_table :hourlies do |t|
      t.references :weather, foreign_key: true
      t.string :name
      t.string :summary
      t.string :temp

      t.timestamps
    end
  end
end
