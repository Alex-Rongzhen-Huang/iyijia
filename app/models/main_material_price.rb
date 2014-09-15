class MainMaterialPrice < ActiveRecord::Base
  attr_accessible :economy, :comfort, :luxury, :economy_cost, :comfort_cost, :luxury_cost, :main_material_name, :main_material_name_id

  belongs_to :main_material_name
end
