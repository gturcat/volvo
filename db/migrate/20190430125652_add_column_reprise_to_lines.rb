class AddColumnRepriseToLines < ActiveRecord::Migration[5.2]
  def change
    add_column :lines, :reprise, :boolean
  end
end
