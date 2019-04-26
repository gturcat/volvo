class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :nature_travaux
      t.date :demande_preparation
      t.string :devis_travaux
      t.date :bon_de_commande_travaux
      t.string :bon_de_commande_travaux
      t.date :date_previsionnelle_fin_travaux
      t.string :facture_travaux
      t.string :facture_montant
      t.references :delivery, foreign_key: true

      t.timestamps
    end
  end
end
