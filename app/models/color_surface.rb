class ColorSurface < ActiveRecord::Base
  attr_accessible :title, :picture, :decorate_company_id
  belongs_to :decorate_company

  require 'carrierwave/orm/activerecord'
  mount_uploader :picture, ImageUploader
end
