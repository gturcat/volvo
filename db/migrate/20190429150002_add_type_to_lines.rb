class AddTypeToLines < ActiveRecord::Migration[5.2]
  def change
    add_column :lines, :type, :string
  end
end
