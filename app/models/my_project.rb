class MyProject < ActiveRecord::Base
  attr_accessible :name
  
  has_many :my_project_items
  accepts_nested_attributes_for :my_project_items
  attr_accessible :my_project_items_attributes
  
  belongs_to :order
  attr_accessible :order_id

end