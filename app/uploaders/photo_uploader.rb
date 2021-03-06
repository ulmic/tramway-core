class PhotoUploader < ApplicationUploader
  include ImageDefaults

  def default_url
    ActionController::Base.helpers.asset_path("images/default_photo.png")
  end

  def url
    if file.present? && File.exist?(file.file)
      file.file.match(/\/system\/uploads\/.*/).to_s
    else
      "/assets/tramway/core/mona_lisa_from_prado_square.jpg"
    end
  end

  version :medium do
    process :resize_to_fill => [400, 400]
  end

  version :small do
    process :resize_to_fill => [100, 100]
  end

  # FIXME move to tramway-landing uploader
  version :card do
    process resize_to_fill: [400, 400, 'North']
  end

  # FIXME move to tramway-landing uploader
  version :horizontal do
    process resize_to_fill: [800, 350, 'North']
  end

  attr_reader :width, :height

  before :cache, :capture_size

  def capture_size(file)
    if version_name.blank?
      if file.path.nil?
        img = ::MiniMagick::Image::read(file.file)
        @width = img[:width]
        @height = img[:height]
      else
        @width, @height = `identify -format "%wx %h" #{file.path}`.split(/x/).map{|dim| dim.to_i }
      end
    end
  end
end
