class AddColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :statut, :boolean
  end
end
