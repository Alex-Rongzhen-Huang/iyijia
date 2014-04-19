class DecorateCompany < ActiveRecord::Base
  attr_accessible :brief, :name, :user_id
  has_many :show_houses
  has_many :color_surfaces
  belongs_to :user

  def to_s
    "#{self.name}"
  end
end
