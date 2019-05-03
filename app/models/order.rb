class Order < ApplicationRecord
  belongs_to :sales_advisor
  validates :sales_advisor, presence: true
  has_many :lines, dependent: :delete_all
  has_many :buses, through: :lines
  has_many :trade, through: :lines, dependent: :destroy
end
