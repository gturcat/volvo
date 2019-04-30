class Trade < ApplicationRecord
  belongs_to :line
  belongs_to :bus
end
