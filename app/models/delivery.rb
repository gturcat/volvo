class Delivery < ApplicationRecord
  belongs_to :place, optional: true
  has_one :line, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :works
  has_one :order, through: :line
  has_one_attached :attestation_amenagement
end
