class AvatarUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end

  def content_type_whitelist
    /image\//
  end

  include CarrierWave::MiniMagick
  version :normal do
    process resize_to_fill: [200,200]
  end
  version :preview do
    process resize_to_fill: [75,75]
  end

end
