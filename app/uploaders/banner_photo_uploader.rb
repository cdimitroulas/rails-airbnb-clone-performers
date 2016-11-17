class BannerPhotoUploader < PhotoUploader

  version :banner do
    resize_to_fit 1200, 300
  end

  version :card do
    resize_to_fit 360, 230
  end
  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end
end
