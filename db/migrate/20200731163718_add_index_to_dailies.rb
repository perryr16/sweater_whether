class AddIndexToDailies < ActiveRecord::Migration[5.2]
  def change
    add_column :dailies, :index, :integer
  end
end
