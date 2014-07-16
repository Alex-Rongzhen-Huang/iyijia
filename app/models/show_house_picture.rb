class ShowHousePicture < ActiveRecord::Base
  attr_accessible :brief, :path, :show_house_id
  belongs_to :show_house

  require 'carrierwave/orm/activerecord'
  mount_uploader :path, ImageUploader

  validates :path, :presence => true
end
