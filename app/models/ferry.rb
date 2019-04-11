class Ferry < ApplicationRecord
  belongs_to :bus, optional: true
end
