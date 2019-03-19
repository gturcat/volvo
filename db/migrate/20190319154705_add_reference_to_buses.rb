class AddReferenceToBuses < ActiveRecord::Migration[5.2]
  def change
    add_reference :buses, :type, foreign_key: true
  end
end
