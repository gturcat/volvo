class ChangeTypeColummToFerry < ActiveRecord::Migration[5.2]
  def change
    remove_column :ferries, :site
    remove_column :ferries, :numero_bdc
    add_column :ferries, :site, :boolean
    add_column :ferries, :numero_bdc, :boolean
  end
end
