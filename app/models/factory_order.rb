class FactoryOrder < ApplicationRecord
  belongs_to :bus, optional: true
  belongs_to :partner, optional: true
  has_many :documents, dependent: :destroy
  has_many :employee_partners, through: :partner
  has_one_attached :VCR
  has_one_attached :Document_de_Transport
  has_one_attached :Delivery_Note
  has_one_attached :VCR
  has_one_attached :Photos_Livraison
end
