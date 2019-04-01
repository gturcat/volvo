class AddVcrToFactoryOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :factory_orders, :vcr, :text
  end
end
