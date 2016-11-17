class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def public_id
    return "airbnb-clone/" + model.name
  end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
