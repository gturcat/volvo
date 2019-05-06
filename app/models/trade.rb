class Trade < ApplicationRecord
  belongs_to :line
  belongs_to :bus
  has_many :documents, dependent: :destroy
end
