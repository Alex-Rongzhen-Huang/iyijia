class MyProject < ActiveRecord::Base
  attr_accessible :name
  
  has_many :my_project_items,  :dependent => :destroy
  accepts_nested_attributes_for :my_project_items, allow_destroy: true
  attr_accessible :my_project_items_attributes
  
  belongs_to :order
  attr_accessible :order_id

  validates :name, :order_id, :presence => true

end
