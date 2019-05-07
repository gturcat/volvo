class AddReferencesToLines < ActiveRecord::Migration[5.2]
  def change
    add_reference :lines, :delivery, foreign_key: true
  end
end
