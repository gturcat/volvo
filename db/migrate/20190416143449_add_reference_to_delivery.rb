class AddReferenceToDelivery < ActiveRecord::Migration[5.2]
  def change
     add_reference :deliveries, :place, index: true
  end
end
