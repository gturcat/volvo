class RemoveLieuLivraisonToDelivery < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :lieu_livraison
  end
end
