class PfdFileUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  make_private

end
