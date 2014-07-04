class DecorateSchemeItem < ActiveRecord::Base
  belongs_to :decorate_scheme
  attr_accessible :description, :path, :decorate_scheme_id

  require 'carrierwave/orm/activerecord'
  mount_uploader :path, ImageUploader
end
