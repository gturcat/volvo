class FactoryOrder < ApplicationRecord
  belongs_to :bus, optional: true
  belongs_to :partner, optional: true
  has_many :documents, dependent: :destroy
  has_many :employee_partners, through: :partner
  has_one_attached :vcr
  has_one_attached :document_de_transport
  has_one_attached :delivery_note
  has_one_attached :vcr
  has_many_attached :photos_livraison

  enum statut: { pending: 0, close: 1, cancel: 2 }

end
