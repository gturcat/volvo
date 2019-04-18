class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :lieu_prepa
      t.string :lieu_livraison
      t.date :date_livraison
      t.time :heure_livraison
      t.string :bon_de_commande
      t.string :plan_implantation
      t.string :info_peinture
      t.string :info_pneu
      t.string :plan_vocp_exl
      t.string :fiche_rcr
      t.string :email_entree_bdc
      t.string :email_entree_bdc_date
      t.string :photos
      t.string :bl_recu
      t.string :attestation_ead
      t.string :attestation_limiteur_vitesse
      t.string :dcok_recu
      t.date :cdoc_envoye
      t.string :enregistrement_cm
      t.string :enregistrement_vda
      t.references :bus, foreign_key: true

      t.timestamps
    end
  end
end
