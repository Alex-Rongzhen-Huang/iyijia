# encoding: UTF-8
class MainMaterialPackage < ActiveRecord::Base
  belongs_to :main_material_name
  belongs_to :main_material
  belongs_to :main_material_name_sub_category

  attr_accessible :name,:main_material_name_id,:main_material_id,:main_material_name_sub_category_id

  validates :name,:main_material_name_id,:main_material_id, :presence => true

  PACKAGE_TYPES = %w[经济型 舒适型 豪华型]
end
