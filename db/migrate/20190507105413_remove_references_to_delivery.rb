class RemoveReferencesToDelivery < ActiveRecord::Migration[5.2]
  def change
    remove_reference :deliveries, :bus, index: true
  end
end
