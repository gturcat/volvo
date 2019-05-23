class AddNoteToDelivery < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :note, :text
  end
end
