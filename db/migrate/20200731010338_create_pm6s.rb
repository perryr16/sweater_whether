class CreatePm6s < ActiveRecord::Migration[5.2]
  def change
    create_table :pm6s do |t|
      t.references :weather, foreign_key: true
      t.string :temp
      t.string :summary

      t.timestamps
    end
  end
end
