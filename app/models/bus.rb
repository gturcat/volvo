class Bus < ApplicationRecord
  has_many :lines, dependent: :destroy
  accepts_nested_attributes_for :lines
  has_many :factory_orders, dependent: :destroy
  accepts_nested_attributes_for :factory_orders
  belongs_to :description, optional: true
  belongs_to :type, optional: true
  has_many :orders, through: :lines
  has_many :ferries, dependent: :destroy
  accepts_nested_attributes_for :ferries
  has_many :trades, dependent: :destroy
  has_many :partners, through: :factory_orders
  accepts_nested_attributes_for :partners

  enum statut1: { disponible: "disponible", indisponible: "indisponible", facture_livre: "facture_livre", en_commande: "en_commande" }

  scope :ordered, -> { includes(:lines, :orders).where(orders: {statut: "pending"} ) }
end
