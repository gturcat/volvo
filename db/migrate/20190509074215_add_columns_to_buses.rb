class AddColumnsToBuses < ActiveRecord::Migration[5.2]
  def change
    add_column :buses, :option_contremarque, :string
    add_column :buses, :option_commercial, :string
    add_column :buses, :date_option, :date
    add_column :buses, :prix_mini, :string
    add_column :buses, :version, :string
    add_column :buses, :implantation, :string
  end
end
