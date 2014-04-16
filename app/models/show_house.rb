class ShowHouse < ActiveRecord::Base
  attr_accessible :area, :brief, :house_type, :need_to_know, :overview, :price, :style, :title

  belongs_to :decorate_company
  attr_accessible :decorate_company_id

  has_many :show_house_pictures
  accepts_nested_attributes_for :show_house_pictures
  attr_accessible :show_house_pictures_attributes
end
