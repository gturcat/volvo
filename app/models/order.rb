class Order < ApplicationRecord
  belongs_to :SalesAdvisor
  belongs_to :OrderBook
  has_many :lines
end
