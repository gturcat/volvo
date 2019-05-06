class AddReferencesFromTradeToDocument < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :trade, foreign_key: true
  end
end
