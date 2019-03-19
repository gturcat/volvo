class AddColumnToLines < ActiveRecord::Migration[5.2]
  def change
    add_reference :lines, :bus, foreign_key: true
  end
end
