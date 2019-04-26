class Line < ApplicationRecord
  belongs_to :order
  belongs_to :bus
  belongs_to :order_book, optional: true
end
