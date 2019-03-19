class CreateOrderBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :order_books do |t|
      t.string :name

      t.timestamps
    end
  end
end
