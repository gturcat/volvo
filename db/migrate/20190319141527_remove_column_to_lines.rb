class RemoveColumnToLines < ActiveRecord::Migration[5.2]
  def change
      remove_column :lines, :description_id
  end
end
