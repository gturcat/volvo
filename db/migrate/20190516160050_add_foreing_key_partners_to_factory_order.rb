class AddForeingKeyPartnersToFactoryOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :factory_orders, :partner, index: true
  end
end
