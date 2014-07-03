class HouseFitment < ActiveRecord::Base
  attr_accessible :address, :contact, :phone, :email, :notes

  def to_s
    "#{self.id} - #{self.address} - #{self.contact} - #{self.phone}"
  end
end
