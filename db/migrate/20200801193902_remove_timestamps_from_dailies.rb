class RemoveTimestampsFromDailies < ActiveRecord::Migration[5.2]
  def change
    remove_column :dailies, :created_at, :string
    remove_column :dailies, :updated_at, :string
  end
end
