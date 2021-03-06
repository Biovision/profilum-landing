class CenterImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::BombShelter

  def max_pixel_dimensions
    [2000, 2000]
  end

  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small_2x do
    resize_to_fit 220, 220
  end

  version :small, from_version: :small_2x do
    resize_to_fit 110, 110
  end

  version :preview_2x, from_version: :small_2x do
    resize_to_fit 160, 160
  end

  version :preview, from_version: :preview_2x do
    resize_to_fit 80, 80
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg png)
  end
end
