class CreateAm12s < ActiveRecord::Migration[5.2]
  def change
    create_table :am12s do |t|
      t.references :weather, foreign_key: true
      t.string :temp
      t.string :summary

      t.timestamps
    end
  end
end
