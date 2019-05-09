class RemoveColumsToDelivery < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :bon_de_commande
    remove_column :deliveries, :plan_implantation
    remove_column :deliveries, :info_peinture
    remove_column :deliveries, :info_pneu
    remove_column :deliveries, :plan_vocp_exl
    remove_column :deliveries, :fiche_rcr
    remove_column :deliveries, :photos
    remove_column :deliveries, :bl_recu
    remove_column :deliveries, :attestation_ead
    remove_column :deliveries, :attestation_limiteur_vitesse
    remove_column :deliveries, :dcok_recu
  end
end
