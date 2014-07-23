class ConstructionItem < ActiveRecord::Base
  attr_accessible :name, :process_description,:type_of_work, :type_of_work_id, :unit

  belongs_to :type_of_work
end
