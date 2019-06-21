class AddColumnsToFactoryOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :factory_orders, :Document_de_Transport, :string
    add_column :factory_orders, :Delivery_Note, :string
    add_column :factory_orders, :VCR, :string
    add_column :factory_orders, :Photos_Livraison, :string
  end
end
