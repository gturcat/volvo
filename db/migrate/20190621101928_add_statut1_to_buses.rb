class AddStatut1ToBuses < ActiveRecord::Migration[5.2]
  def change
    remove_column :buses, :statut1
    add_column :buses, :statut1, :integer
  end
end
