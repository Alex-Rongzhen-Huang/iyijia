class HouseFitment < ActiveRecord::Base
  attr_accessible :address, :contact, :phone, :email, :notes, :budget, :house_type

  belongs_to :user
  attr_accessible :user_id
  belongs_to :show_house
  attr_accessible :show_house_id

  def to_s
    "#{self.id} - #{self.address} - #{self.contact} - #{self.phone}"
  end

  validates :address, :contact, :phone, :email, :budget, :house_type, :presence => true
end
