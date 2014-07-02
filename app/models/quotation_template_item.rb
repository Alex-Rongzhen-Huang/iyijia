class QuotationTemplateItem < ActiveRecord::Base
  belongs_to :quotation_template
  belongs_to :construction_item
  belongs_to :main_material
  attr_accessible :category, :construction_item_number, :labour_cost, :labour_cost_total, :main_material_total_price, :note, :supplementary_material_price, :supplementary_material_total_price, :supplementary_material_type, :total_price
  attr_accessible :quotation_template_id, :construction_item_id, :main_material_id
end
