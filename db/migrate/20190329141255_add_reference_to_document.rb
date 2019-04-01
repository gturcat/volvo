class AddReferenceToDocument < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :factory_order, foreign_key: true
  end
end
