class QuotationSelectedItem < ActiveRecord::Base
  belongs_to :main_material_name
  belongs_to :main_material_name_sub_category
  belongs_to :main_material
  belongs_to :order_quotation
  attr_accessible :delta_price, :upgrade
  attr_accessible :main_material_name_id, :main_material_name_sub_category_id, :main_material_id, :order_quotation_id
end
