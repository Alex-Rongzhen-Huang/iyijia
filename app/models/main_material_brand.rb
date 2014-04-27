class MainMaterialBrand < ActiveRecord::Base
  attr_accessible :logo_path, :name

  has_many :show_house_main_material_brands
  # has_many :show_houses, :through => :show_house_main_material_brands

  require 'carrierwave/orm/activerecord'
  mount_uploader :logo_path, ImageUploader
end
