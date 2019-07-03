class AddStatutToFactoryOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :factory_orders, :statut, :integer
  end
end
