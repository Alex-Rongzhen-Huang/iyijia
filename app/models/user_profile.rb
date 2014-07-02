class UserProfile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :avatar, :gender, :location, :mobile, :nickname
  attr_accessible :user_id
end
