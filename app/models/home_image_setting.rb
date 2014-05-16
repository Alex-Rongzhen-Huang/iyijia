class HomeImageSetting < ActiveRecord::Base
  attr_accessible :img1, :img2, :img3, :img4, :img5

  require 'carrierwave/orm/activerecord'
  mount_uploader :img1, ImageUploader
  mount_uploader :img2, ImageUploader
  mount_uploader :img3, ImageUploader
  mount_uploader :img4, ImageUploader
  mount_uploader :img5, ImageUploader
end
