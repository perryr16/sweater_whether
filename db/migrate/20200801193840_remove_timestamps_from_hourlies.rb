class RemoveTimestampsFromHourlies < ActiveRecord::Migration[5.2]
  def change
    remove_column :hourlies, :created_at, :string
    remove_column :hourlies, :updated_at, :string
  end
end
