class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.string :prix_achat
      t.date :date_rentree_bdc
      t.date :date_rentree
      t.time :heure_rentree
      t.string :fiche_RCR
      t.string :demande_cession
      t.string :cerfa
      t.string :ci_barre
      t.string :controle_technique
      t.string :certif_non_gage
      t.string :coc
      t.string :attestation_amenagement
      t.string :lieu_conservation_papier
      t.string :travaux_previsionnels
      t.string :note

      t.timestamps
    end
  end
end
