class AddColumnToDelivery < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :duree_buy_back, :integer
  end
end
