class PfdFileUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
