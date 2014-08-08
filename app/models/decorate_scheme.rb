# encoding: UTF-8
class DecorateScheme < ActiveRecord::Base
  attr_accessible :name, :confirm_status

  has_many :decorate_scheme_items,  :dependent => :destroy
  accepts_nested_attributes_for :decorate_scheme_items, allow_destroy: true
  attr_accessible :decorate_scheme_items_attributes

  belongs_to :order
  attr_accessible :order_id

  validates :name, :order_id, :presence => true
  CONFIRM_STATUS = %w[未确认 已确认]

end
