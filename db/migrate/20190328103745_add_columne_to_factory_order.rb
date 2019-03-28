class AddColumneToFactoryOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :factory_orders, :bus, foreign_key: true
  end
end
