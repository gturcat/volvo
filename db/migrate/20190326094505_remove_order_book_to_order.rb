class RemoveOrderBookToOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :order_book_id
  end
end
