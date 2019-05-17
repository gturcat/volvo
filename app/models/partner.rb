class Partner < ApplicationRecord
  has_many :factory_orders
  has_many :employee_partners
end
