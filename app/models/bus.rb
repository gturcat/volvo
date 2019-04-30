class Bus < ApplicationRecord
  has_many :lines, dependent: :destroy
  accepts_nested_attributes_for :lines
  has_many :factory_orders, dependent: :destroy
  accepts_nested_attributes_for :factory_orders
  belongs_to :description
  belongs_to :type, optional: true
  has_many :orders, through: :lines
  has_many :ferries, dependent: :destroy
  accepts_nested_attributes_for :ferries
  has_many :deliveries, dependent: :destroy
  accepts_nested_attributes_for :deliveries
  has_many :trades, dependent: :destroy
end
