class AddBdcEnvoyeToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :bdc_envoye, :boolean
    add_column :works, :date_previsionelle_fin_travaux, :date
    add_column :works, :note, :text
  end
end
