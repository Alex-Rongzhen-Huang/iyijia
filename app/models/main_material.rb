class MainMaterial < ActiveRecord::Base
  attr_accessible :main_material_name_id, :picture, :price, :specifications, :type_of_work_id, :decorate_company_id, :main_material_brand_id

  belongs_to :decorate_company
  belongs_to :main_material_brand
  belongs_to :main_material_name
  belongs_to :type_of_work
  
  require 'carrierwave/orm/activerecord'
  mount_uploader :picture, ImageUploader
end
