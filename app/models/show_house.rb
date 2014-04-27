# coding: utf-8
class ShowHouse < ActiveRecord::Base
  attr_accessible :area, :brief, :house_type, :need_to_know, :overview, :price, :style, :concept, :usage, :title

  belongs_to :decorate_company
  attr_accessible :decorate_company_id

  has_many :show_house_pictures
  accepts_nested_attributes_for :show_house_pictures
  attr_accessible :show_house_pictures_attributes

  has_many :show_house_main_material_brands
  has_many :main_material_brands, :through => :show_house_main_material_brands
  attr_accessible :main_material_brand_ids

  HOUSE_TYPES = %w[一室一厅一卫 两室一厅一卫 两室两厅一卫 两室两厅两卫 三室一厅一卫 三室两厅一卫 三室两厅两卫 其他豪宅]
  STYLE_TYPES = %w[现代简约 田园风格 地中海风格 欧式风格 美式风格 中式风格 ]
end
