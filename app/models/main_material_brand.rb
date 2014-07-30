class MainMaterialBrand < ActiveRecord::Base
  attr_accessible :logo_path, :name, :main_material_name_id

  has_many :show_house_main_material_brands
  belongs_to :main_material_name
  # has_many :show_houses, :through => :show_house_main_material_brands

  require 'carrierwave/orm/activerecord'
  mount_uploader :logo_path, ImageUploader
end
