# encoding: UTF-8
class OrderQuotation < ActiveRecord::Base
  # 根据用户订单 生成 报价单
  belongs_to :order
  has_many :custom_construction_items,  :dependent => :destroy
  accepts_nested_attributes_for :custom_construction_items, allow_destroy: true
  attr_accessible :custom_construction_items_attributes

  attr_accessible :order_id,:main_material_package_type,:confirmed_area, :constructor, :constructor_contact

  validates :order_id,:main_material_package_type,:confirmed_area, :presence => true

  PACKAGE_TYPES = %w[经济型 舒适型 豪华型]
end
