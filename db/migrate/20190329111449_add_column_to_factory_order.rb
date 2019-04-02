class AddColumnToFactoryOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :factory_orders, :vcr, :string
  end
end
