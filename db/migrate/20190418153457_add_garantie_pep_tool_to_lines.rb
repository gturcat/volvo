class AddGarantiePepToolToLines < ActiveRecord::Migration[5.2]
  def change
    add_column :lines, :garantie_pep_tool, :boolean
    add_column :lines, :telematique_demandee, :string
  end
end
