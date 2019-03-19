class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.date :delai_previsionnel
      t.date :date_livraison_bdc
      t.string :couleur_ext_vehicule
      t.string :financement_type
      t.string :mention_garantie
      t.string :mention_telematique
      t.references :order
      t.references :description

      t.timestamps
    end
  end
end
