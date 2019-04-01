class RemoveVcrFromFactoryOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :factory_orders, :vcr
  end
end
