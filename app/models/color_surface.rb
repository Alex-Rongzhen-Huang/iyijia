class ColorSurface < ActiveRecord::Base
  attr_accessible :title, :picture,:picture2,:picture3,:picture4,:picture5, :decorate_company_id
  belongs_to :decorate_company

  require 'carrierwave/orm/activerecord'
  mount_uploader :picture, ImageUploader
  mount_uploader :picture2, ImageUploader
  mount_uploader :picture3, ImageUploader
  mount_uploader :picture4, ImageUploader
  mount_uploader :picture5, ImageUploader
end
