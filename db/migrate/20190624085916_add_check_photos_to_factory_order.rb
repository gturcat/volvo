class AddCheckPhotosToFactoryOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :factory_orders, :photos_envoyees_usine, :boolean
  end
end
