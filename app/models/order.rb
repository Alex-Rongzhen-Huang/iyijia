# coding: utf-8
class Order < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user_id, :decorate_company_id, :show_house_id, :house_fitment_id, :measure_status, :quotation_status, :quotation_link
  belongs_to :user
  belongs_to :decorate_company
  belongs_to :show_house
  belongs_to :house_fitment

  MEASURE_STATUS = %w[未测量 已测量]
  QUOTATION_STATUS = %w[未报价 已报价]

  validates :user_id, :show_house_id, :house_fitment_id, :measure_status, :quotation_status, :presence => true

  def to_s
    "[#{self.id}] - #{self.measure_status} - #{self.quotation_status} - #{self.user} -#{self.house_fitment}"
  end
end
