class Line < ApplicationRecord
  belongs_to :order
  belongs_to :bus
  belongs_to :order_book, optional: true
  has_one :trade, dependent: :destroy
  has_one :training, dependent: :destroy
  belongs_to :delivery, optional: true
end
