class Delivery < ApplicationRecord
  belongs_to :place, optional: true
  has_one :line, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :works
  accepts_nested_attributes_for :works,  reject_if: :all_blank, allow_destroy: true
  has_one :order, through: :line
  has_one_attached :attestation_amenagement
  has_one_attached :coc
  has_one_attached :cpi
  has_one_attached :cerfa_changement_titulaire
  has_one_attached :cerfa_cession
  has_one_attached :bulletion_de_livraison
  has_one_attached :cdoc
  has_one_attached :attestation_ead
  has_one_attached :attestation_limiteur_de_vitesse
  has_one_attached :photos_vehicule
  has_one_attached :facture
  has_one_attached :bon_de_commande
  has_one_attached :offre_configuration_avec_plan_implantation
  has_one_attached :information_peinture
  has_one_attached :plan_vosp
  has_one_attached :fiche_rcr
  has_one_attached :a_reception_envoi_papiers_originaux
  has_one_attached :justificatif_financement

  enum statut: { pending: 0, close: 1, cancel: 2 }
end
