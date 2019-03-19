class Bus < ApplicationRecord
  has_many :lines
  belongs_to :description
  belongs_to :type
  has_many :orders, through: :lines, dependent: :destroy
end
