class MainMaterialNameSubCategory < ActiveRecord::Base
  belongs_to :main_material_name
  attr_accessible :name
end
