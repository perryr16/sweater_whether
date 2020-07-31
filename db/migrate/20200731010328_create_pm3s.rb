class CreatePm3s < ActiveRecord::Migration[5.2]
  def change
    create_table :pm3s do |t|
      t.references :weather, foreign_key: true
      t.string :temp
      t.string :summary

      t.timestamps
    end
  end
end
