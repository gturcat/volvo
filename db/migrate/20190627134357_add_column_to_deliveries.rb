class AddColumnToDeliveries < ActiveRecord::Migration[5.2]
  def change
    remove_column :lines, :financement_type
    add_column :deliveries, :financement_type, :string
    add_column :deliveries, :contact_banque, :string
    add_column :deliveries, :note_financement, :text
  end
end
