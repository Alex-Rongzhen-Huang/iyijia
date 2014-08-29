# coding: utf-8
class MainMaterial < ActiveRecord::Base
  attr_accessible :main_material_name_id, :picture, :price, :specifications, :type_of_work_id, :decorate_company_id, :main_material_brand_id
  attr_accessible :name, :package_type, :description

  belongs_to :decorate_company
  belongs_to :main_material_brand
  belongs_to :main_material_name
  belongs_to :type_of_work

  has_many :main_material_packages

  scope :uniquely_named, group(:specifications)
  require 'carrierwave/orm/activerecord'
  mount_uploader :picture, ImageUploader

  PACKAGE_TYPES = %w[经济型 舒适型 豪华型]

end
