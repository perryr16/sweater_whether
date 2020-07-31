class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.string :city
      t.string :state
      t.string :country
      t.string :high
      t.string :low
      t.string :date
      t.string :time
      t.string :summary
      t.string :feels_like
      t.string :humidity
      t.string :visibility
      t.string :uv_index
      t.string :sunrise
      t.string :sunset

      t.timestamps
    end
  end
end
