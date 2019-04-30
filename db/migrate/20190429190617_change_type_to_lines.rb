class ChangeTypeToLines < ActiveRecord::Migration[5.2]
  def change
     rename_column :lines, :type, :type_commande
  end
end
