class RemoveTypeCommandeToLines < ActiveRecord::Migration[5.2]
  def change
    remove_column :lines, :type_commande
  end
end
