class Work < ApplicationRecord
  belongs_to :delivery, optional: true
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, :allow_destroy => true
end
