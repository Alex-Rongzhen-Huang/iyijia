class MainMaterialName < ActiveRecord::Base
  attr_accessible :name
  has_many :main_materials
  has_many :main_material_brands
  has_many :main_material_packages

  # 维护主材二级分类
  has_many :main_material_name_sub_categories,  :dependent => :destroy
  accepts_nested_attributes_for :main_material_name_sub_categories, allow_destroy: true
  attr_accessible :main_material_name_sub_categories_attributes

end
