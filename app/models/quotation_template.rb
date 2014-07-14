class QuotationTemplate < ActiveRecord::Base
  attr_accessible :title
  has_many :quotation_template_items,  :dependent => :destroy
  accepts_nested_attributes_for :quotation_template_items, allow_destroy: true
end
