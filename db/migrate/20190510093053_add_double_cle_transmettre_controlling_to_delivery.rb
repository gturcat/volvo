class AddDoubleCleTransmettreControllingToDelivery < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :envoi_double_cle, :boolean
    add_column :deliveries, :transmission_bl_controlling, :boolean
  end
end
