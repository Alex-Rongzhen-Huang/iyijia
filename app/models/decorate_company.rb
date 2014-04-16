class DecorateCompany < ActiveRecord::Base
  attr_accessible :brief, :name, :admin_user_id
  has_many :show_houses
  has_many :color_surfaces
  belongs_to :admin_user
end
