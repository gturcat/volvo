class RenameColumnToBuses < ActiveRecord::Migration[5.2]
  def change
    rename_column :buses, :status1, :statut1
    rename_column :buses, :status2, :statut2
  end
end
