class Task < ApplicationRecord
  belongs_to :work, optional: true
end
