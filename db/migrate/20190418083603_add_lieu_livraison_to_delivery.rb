class AddLieuLivraisonToDelivery < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :lieu_livraison, :string
  end
end
