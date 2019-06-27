class Work < ApplicationRecord
  belongs_to :delivery, optional: true
  has_one_attached :devis
  has_one_attached :facture_travaux
end
