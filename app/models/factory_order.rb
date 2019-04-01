class FactoryOrder < ApplicationRecord
  belongs_to :bus, optional: true
  has_many :documents
end
