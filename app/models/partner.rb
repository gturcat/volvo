class Partner < ApplicationRecord
  has_many :factory_orders
  has_many :employee_partners
  has_many :buses, through: :factory_orders
end
