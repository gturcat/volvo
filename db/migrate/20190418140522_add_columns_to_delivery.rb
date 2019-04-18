class AddColumnsToDelivery < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :date_facturation, :date
    add_column :deliveries, :montant, :string
    add_column :deliveries, :entitee, :string
    add_column :deliveries, :duree_buy_back, :string
    add_column :deliveries, :pourcentage_buy_back, :string
  end
end
