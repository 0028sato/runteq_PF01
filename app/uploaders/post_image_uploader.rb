class PostImageUploader < CarrierWave::Uploader::Base

  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

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
