# coding: utf-8
class ShowHouse < ActiveRecord::Base
  attr_accessible :area, :brief, :need_to_know, :overview, :price, :style, :usage, :title, :bedroom, :livingroom, :bathroom

  belongs_to :decorate_company
  attr_accessible :decorate_company_id

  has_many :show_house_pictures
  accepts_nested_attributes_for :show_house_pictures
  attr_accessible :show_house_pictures_attributes

  has_many :show_house_main_material_brands
  has_many :main_material_brands, :through => :show_house_main_material_brands
  attr_accessible :main_material_brand_ids

  acts_as_votable

  HOUSE_TYPES = %w[一室一厅一卫 两室一厅一卫 两室两厅一卫 两室两厅两卫 三室一厅一卫 三室两厅一卫 三室两厅两卫 其他豪宅]
  STYLE_TYPES = %w[现代简约 田园风格 地中海风格 欧式风格 美式风格 中式风格 ]
  USAGE_TYPES = %w[住宅 商业 ]
  ROOM_TYPES =  %w[一 二 三 四 五 六 七 八 九]

  scope :style_as, lambda { |style| where("style = ?", style) }
  scope :usage_as, lambda { |usage| where("usage = ?", usage) }
  scope :area_in, lambda { |from, to| where("area >= ? and area <= ?", from, to) }
  scope :price_in, lambda { |from, to| where("price >= ? and price <= ?", from, to) }

  public
  def house_type
     "#{bedroom}室#{livingroom}厅#{bathroom}卫"
  end
end
