class MainMaterialName < ActiveRecord::Base
  attr_accessible :name
  has_many :main_materials
  has_many :main_material_brands
end
