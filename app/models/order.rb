class Order < ApplicationRecord
  belongs_to :sales_advisor
  validates :sales_advisor, presence: true
  has_many :lines
  has_many :buses, through: :lines
end
