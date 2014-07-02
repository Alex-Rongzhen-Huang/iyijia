class Order < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user_id, :decorate_company_id, :show_house_id, :house_fitment_id, :measure_status, :quotation_status, :quotation_link
  belongs_to :user
  belongs_to :decorate_company
  belongs_to :show_house
  belongs_to :house_fitment
end
