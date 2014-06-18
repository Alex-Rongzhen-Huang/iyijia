class MainMaterial < ActiveRecord::Base
  attr_accessible :name, :picture, :price, :type, :type_of_work, :decorate_company_id, :main_material_brand_id

  belongs_to :decorate_company
  belongs_to :main_material_brand
end
