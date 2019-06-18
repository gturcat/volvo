class ChangeStatutIntoStringToOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :statut
    add_column :orders, :statut, :string
  end
end
