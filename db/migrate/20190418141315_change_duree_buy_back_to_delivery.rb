class ChangeDureeBuyBackToDelivery < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :duree_buy_back
  end
end
