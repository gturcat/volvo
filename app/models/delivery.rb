class Delivery < ApplicationRecord
  belongs_to :bus, optional: true
  belongs_to :place, optional: true
end
