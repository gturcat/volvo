class FactoryOrder < ApplicationRecord
  belongs_to :bus, optional: true
end
