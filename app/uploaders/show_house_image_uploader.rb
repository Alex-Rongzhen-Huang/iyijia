# encoding: utf-8
class ShowHouseImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
     # For Rails 3.1+ asset pipeline compatibility:
     ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))

     #"/images/fallback/" + [version_name, "default.png"].compact.join('_')
   end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  #version :thumb do
  #   process :resize_to_fit => [50, 50]
  #end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
     %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  # 用作9宫格的缩略图
  version :nine   do  |uploader|
    process :resize_height_to_431, if: ->( uploader, args ) { uploader.is_landscape?(uploader.model.path) }

    process :resize_width_to_431, if: ->( uploader, args ) { !(uploader.is_landscape?(uploader.model.path)) }
  end

  # 用作9宫格下面更小的一层缩略图
  version :t, :from_version => :nine do
    process :resize_to_fit => [100, 100]
  end

  def is_landscape? picture
    image = MiniMagick::Image.open(picture.path)
    result = image[:width] > image[:height]
    puts "is_landscape? #{result} - #{image[:width]}, #{image[:height]}"
    result
  end

  #TODO: 写个脚本批量处理之前已经上传过的图片

  # resize with min-width 431, which leads to height > 431
  # 竖屏
  def resize_width_to_431
    puts "call resize_width_to_431"
    manipulate! do |img|
      img.resize("431")
      img = yield(img) if block_given?

      puts "NOW - #{img[:width]}, #{img[:height]}"

      top = (img[:height]-431)/2
      left = 0

      puts "size[#{img[:width]}x#{img[:height]}] -> crop to 431x431+#{left}+#{top}"
      img.crop("431x431+#{left}+#{top}")


      img = yield(img) if block_given?
      img
    end
  end

  # resize with min-height 431, which leads to width > 431
  # 横屏
  def resize_height_to_431
    puts "call resize_height_to_431"
    manipulate! do |img|
      img.resize("x431")
      img = yield(img) if block_given?
      puts "NOW - #{img[:width]}, #{img[:height]}"

      top = 0
      left = (img[:width]-431)/2

      puts "size[#{img[:width]}x#{img[:height]}] -> crop to 431x431+#{left}+#{top}"
      img.crop("431x431+#{left}+#{top}")


      img = yield(img) if block_given?
      img
    end
  end
end
