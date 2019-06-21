class RenameInformationPeintureToDelivery < ActiveRecord::Migration[5.2]
  def change
    rename_column :deliveries, :information_Peinture, :information_peinture
  end
end
