class DecorateScheme < ActiveRecord::Base
  attr_accessible :name

  has_many :decorate_scheme_items
  accepts_nested_attributes_for :decorate_scheme_items
  attr_accessible :decorate_scheme_items_attributes

  belongs_to :order
  attr_accessible :order_id
end
