class MyProjectItem < ActiveRecord::Base
  belongs_to :my_project
  attr_accessible :description, :path, :my_project_id
  
  require 'carrierwave/orm/activerecord'
  mount_uploader :path, ImageUploader

  validates :path, :presence => true
end
