class RemoveStringColumnsToDelivery < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :enregistrement_cm
    remove_column :deliveries, :enregistrement_vda
    add_column :deliveries, :enregistrement_cm, :boolean
    add_column :deliveries, :enregistrement_vda, :boolean
  end
end
