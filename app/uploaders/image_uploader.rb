# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  include CarrierWave::MimeTypes

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    super.chomp(File.extname(super)) + '.png' if original_filename.present?
  end

  process :set_content_type
  process convert: :png

  # resize
  process resize_to_limit: [800, 800]
  version :thumb do
    process resize_to_limit: [300, 300]
  end
  version :mini, from_version: :thumb do
    process resize_to_limit: [100, 100]
  end

end
