class AddAvarieToFactoryOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :factory_orders, :avarie, :boolean
    add_column :factory_orders, :details_avarie, :text
  end
end
