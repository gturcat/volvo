class Delivery < ApplicationRecord
  belongs_to :bus, optional: true
  belongs_to :place, optional: true
  has_many :documents, dependent: :destroy
  has_many :works
end
