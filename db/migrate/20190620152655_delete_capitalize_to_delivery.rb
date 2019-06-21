class DeleteCapitalizeToDelivery < ActiveRecord::Migration[5.2]
  def change
    rename_column :deliveries, :Bulletion_de_livraison, :bulletion_de_livraison
    rename_column :deliveries, :CDOC, :cdoc
    rename_column :deliveries, :Attestation_EAD, :attestation_ead
    rename_column :deliveries, :Attestation_Limiteur_de_Vitesse, :attestation_limiteur_de_vitesse
    rename_column :deliveries, :Photos_Vehicule, :photos_Vehicule
    rename_column :deliveries, :Facture, :facture
    rename_column :deliveries, :Bon_de_commande, :bon_de_commande
    rename_column :deliveries, :Information_Peinture, :information_Peinture
    rename_column :deliveries, :Plan_VOSP, :plan_vosp
    rename_column :deliveries, :Fiche_RCR, :Fiche_rcr
    rename_column :deliveries, :A_Reception_Envoi_papiers_originaux, :a_reception_envoi_papiers_originaux
    rename_column :deliveries, :Justificatif_Financement, :justificatif_financement
  end
end
