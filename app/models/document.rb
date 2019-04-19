class Document < ApplicationRecord
  belongs_to :factory_order, optional: true
  belongs_to :delivery, optional: true
  mount_uploader :pdf, PfdFileUploader
end
