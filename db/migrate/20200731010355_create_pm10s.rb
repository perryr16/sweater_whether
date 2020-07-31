class CreatePm10s < ActiveRecord::Migration[5.2]
  def change
    create_table :pm10s do |t|
      t.references :weather, foreign_key: true
      t.string :temp
      t.string :summary

      t.timestamps
    end
  end
end
