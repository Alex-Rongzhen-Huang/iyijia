class DecorateCompany < ActiveRecord::Base
  attr_accessible :brief, :name, :created_date, :logo_path, :user_id
  has_many :show_houses
  has_many :color_surfaces
  belongs_to :user

  require 'carrierwave/orm/activerecord'
  mount_uploader :logo_path, ImageUploader


  def to_s
    "#{self.id} - #{self.name}"
  end
end
