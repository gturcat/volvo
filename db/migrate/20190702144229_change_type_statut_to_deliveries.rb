class ChangeTypeStatutToDeliveries < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :statut
    add_column :deliveries, :statut, :integer
  end
end
