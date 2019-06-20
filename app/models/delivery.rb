class Delivery < ApplicationRecord
  belongs_to :place, optional: true
  has_one :line, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :works
  has_one :order, through: :line
  has_one_attached :attestation_amenagement
  has_one_attached :coc
  has_one_attached :cpi
  has_one_attached :cerfa_changement_titulaire
  has_one_attached :cerfa_cession
  has_one_attached :Bulletion_de_livraison
  has_one_attached :CDOC
  has_one_attached :Attestation_EAD
  has_one_attached :Attestation_Limiteur_de_Vitesse
  has_one_attached :Photos_Vehicule
  has_one_attached :Facture
  has_one_attached :Bon_de_commande
  has_one_attached :offre_configuration_avec_plan_implantation
  has_one_attached :Information_Peinture
  has_one_attached :Plan_VOSP
  has_one_attached :Fiche_RCR
  has_one_attached :A_Reception_Envoi_papiers_originaux
  has_one_attached :Justificatif_Financement





end
