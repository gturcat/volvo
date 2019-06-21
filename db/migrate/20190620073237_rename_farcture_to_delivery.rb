class RenameFarctureToDelivery < ActiveRecord::Migration[5.2]
  def change
    rename_column :deliveries, :Farcture, :Facture
  end
end
