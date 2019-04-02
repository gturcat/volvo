class Document < ApplicationRecord
  belongs_to :factory_order
  mount_uploader :pdf, PfdFileUploader
end
