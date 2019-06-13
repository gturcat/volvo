class Order < ApplicationRecord
  belongs_to :sales_advisor
  validates :sales_advisor, presence: true
  has_many :lines, dependent: :delete_all
  has_many :buses, through: :lines
  has_many :trades, through: :lines, dependent: :destroy
  has_many :trainings, through: :lines, dependent: :destroy

  enum statut: { pending: 0, close: 1, archive: 2 }
end
