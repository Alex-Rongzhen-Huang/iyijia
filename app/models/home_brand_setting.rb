# encoding: UTF-8
class HomeBrandSetting < ActiveRecord::Base
  attr_accessible :package_type, :path

  PACKAGE_TYPES = %w[经济型 舒适型]

  require 'carrierwave/orm/activerecord'
  mount_uploader :path, ThumbImageUploader
end
