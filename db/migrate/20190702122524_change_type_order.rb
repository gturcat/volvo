class ChangeTypeOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :statut
    add_column :orders, :statut, :integer
  end
end
