class AddStatut1ToBuses < ActiveRecord::Migration[5.2]
  def change
    remove_column :buses, :statut1
    execute <<-SQL
      CREATE TYPE bus_statut1 AS ENUM ('disponible', 'indisponible', 'facture_livre', 'en_commande');
    SQL
    add_column :buses, :statut1, :bus_statut1
  end
end
