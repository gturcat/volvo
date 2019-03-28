class AddReferenceToLines < ActiveRecord::Migration[5.2]
  def change
    add_reference :lines, :order_book, foreign_key: true
  end
end
