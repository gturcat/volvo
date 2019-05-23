class RemoveColumnsToLine < ActiveRecord::Migration[5.2]
  def change
    remove_column :lines, :garantie_pep_tool
    remove_column :lines, :telematique_demandee
    add_column :deliveries, :garantie_pep_tool, :boolean
    add_column :deliveries, :telematique_demandee, :boolean
  end
end
