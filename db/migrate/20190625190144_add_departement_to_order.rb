class AddDepartementToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :departement, :string
  end
end
