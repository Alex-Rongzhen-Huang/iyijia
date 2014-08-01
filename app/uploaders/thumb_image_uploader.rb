# encoding: utf-8
class ThumbImageUploader < CarrierWave::Uploader::Base

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


  # flickr的缩略图规则
  #"_t": thumbnail, 100px on longest side
  #"_m": small, 240px on longest side
  #"_n": small, 320px on longest side
  #"" : medium, 500px on longest side
  #"_z": medium 640, 640px on longest side
  #"_c": medium 800, 800px on longest side
  #"_b": large, 1024px on longest side
  #
  version :b do
    process :resize_to_fit => [1024, 1024]
  end
  version :c, :from_version => :b do
    process :resize_to_fit => [800, 800]
  end
  version :z, :from_version => :c do
    process :resize_to_fit => [640, 640]
  end
  # 这个文件名和flickr的规则不一致，原图还是原图，500的带_
  version :_, :from_version => :z do
    process :resize_to_fit => [500, 500]
  end
  version :n, :from_version => :z do
    process :resize_to_fit => [320, 320]
  end
  version :m, :from_version => :n do
    process :resize_to_fit => [240, 240]
  end
  version :t, :from_version => :m do
    process :resize_to_fit => [100, 100]
  end

end
