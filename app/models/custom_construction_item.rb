class CustomConstructionItem < ActiveRecord::Base
  belongs_to :order_quotation
  belongs_to :construction_item
  attr_accessible :count, :description, :price
  attr_accessible :order_quotation_id, :construction_item_id
end
