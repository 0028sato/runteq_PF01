class AvatarUploader < CarrierWave::Uploader::Base
  #画像をアップロード
  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

#アップロードした画像の表示
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

#デフォルト画像の設定
 def default_url
  "default.png"
 end

#アップロードファイルの指定
  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
