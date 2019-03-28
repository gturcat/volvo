class AddDescriptionIdToBus < ActiveRecord::Migration[5.2]
  def change
    add_reference :buses, :description, foreign_key: true
  end
end
