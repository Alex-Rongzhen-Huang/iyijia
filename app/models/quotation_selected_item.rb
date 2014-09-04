class QuotationSelectedItem < ActiveRecord::Base
  belongs_to :main_material_name
  belongs_to :main_material_name_sub_category
  belongs_to :main_material
  belongs_to :order_quotation
  attr_accessible :delta_price, :upgrade
end
