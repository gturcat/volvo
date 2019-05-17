class AddStatutToDelivery < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :statut, :boolean
  end
end
