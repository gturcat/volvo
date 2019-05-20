class FactoryOrder < ApplicationRecord
  belongs_to :bus, optional: true
  belongs_to :partner, optional: true
  has_many :documents, dependent: :destroy
  has_many :employee_partners, through: :partner
end
