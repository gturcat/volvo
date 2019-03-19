class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :client
      t.string :numero_bon_de_commande
      t.date :date
      t.references :order_book
      t.references :sales_advisor

      t.timestamps
    end
  end
end
