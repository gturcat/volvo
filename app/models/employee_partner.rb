class EmployeePartner < ApplicationRecord
  belongs_to :partner, optional: true
end
