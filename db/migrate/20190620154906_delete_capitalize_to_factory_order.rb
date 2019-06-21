class DeleteCapitalizeToFactoryOrder < ActiveRecord::Migration[5.2]
  def change
    rename_column :factory_orders, :Document_de_Transport, :document_de_transport
    rename_column :factory_orders, :Delivery_Note, :delivery_note
    rename_column :factory_orders, :VCR, :vcr
    rename_column :factory_orders, :Photos_Livraison, :photos_livraison
  end
end
