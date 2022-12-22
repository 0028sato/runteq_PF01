class PostImageUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'board_placeholder.png'
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
