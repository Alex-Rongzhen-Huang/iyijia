class Order < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :admin_user
end
