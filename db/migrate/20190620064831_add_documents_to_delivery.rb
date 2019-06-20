class AddDocumentsToDelivery < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :Bulletion_de_livraison, :string
    add_column :deliveries, :CDOC, :string
    add_column :deliveries, :Attestation_EAD, :string
    add_column :deliveries, :Attestation_Limiteur_de_Vitesse, :string
    add_column :deliveries, :Photos_Vehicule, :string
    add_column :deliveries, :Farcture, :string
    add_column :deliveries, :Bon_de_commande, :string
    add_column :deliveries, :offre_configuration_avec_plan_implantation, :string
    add_column :deliveries, :Information_Peinture, :string
    add_column :deliveries, :Plan_VOSP, :string
    add_column :deliveries, :Fiche_RCR, :string
    add_column :deliveries, :A_Reception_Envoi_papiers_originaux, :string
    add_column :deliveries, :Justificatif_Financement, :string






  end
end

