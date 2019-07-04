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

  enum statut1: { disponible: 0, indisponible: 1, facture_livre: 2, en_commande: 3 }

  scope :ordered, -> { includes(:lines, :orders).where(orders: {statut: "pending"} ) }
end
