# encoding: UTF-8
class OrderQuotation < ActiveRecord::Base
  # 根据用户订单 生成 报价单
  belongs_to :order
  has_many :custom_construction_items,  :dependent => :destroy
  accepts_nested_attributes_for :custom_construction_items, allow_destroy: true
  attr_accessible :custom_construction_items_attributes

  has_many :quotation_selected_items,  :dependent => :destroy
  accepts_nested_attributes_for :quotation_selected_items, allow_destroy: true
  attr_accessible :quotation_selected_items_attributes

  attr_accessible :order_id,:main_material_package_type,:confirmed_area,:bathrooms,:calculated_price, :constructor, :constructor_contact

  validates :order_id,:main_material_package_type,:confirmed_area, :presence => true

  PACKAGE_TYPES = %w[经济型 舒适型 豪华型]
  AREA_RANGE_TYPES = %w[S≤50 50＜S≤55 55＜S≤60 60＜S≤65 65＜S≤70 70＜S≤75 75＜S≤80 80＜S≤85 85＜S≤90 90＜S≤95 95＜S≤100 100＜S≤105  105＜S≤110  110＜S≤115  115＜S≤120  120＜S≤125  125＜S≤130  130＜S≤135  135＜S≤140  140＜S≤145  145＜S≤150]
  BATHROOM_TYPES = %w[1 2]

  before_save :calculate

  protected
  def calculate
    area_range = findAreaRange(self.confirmed_area)
    package_price = PackagePrice.find_by_covered_area_range_and_bathrooms(area_range, self.bathrooms)
    total_price = 0;
    if(self.main_material_package_type == PACKAGE_TYPES[0])
      total_price = package_price.economy_price
    else
      total_price = package_price.comfort_price
    end
    # TODO: add has_many stuff
    self.calculated_price = total_price
  end

  def findAreaRange(area)
    if(area<=50)
      return AREA_RANGE_TYPES[0]
    elsif(area>50 && area<=55)
      return AREA_RANGE_TYPES[1]
    elsif (area>55 && area<=60)
      return AREA_RANGE_TYPES[2]
    elsif (area>60 && area<=65)
      return AREA_RANGE_TYPES[3]
    elsif (area>65 && area<=70)
      return AREA_RANGE_TYPES[4]
    elsif (area>70 && area<=75)
      return AREA_RANGE_TYPES[5]
    elsif (area>75 && area<=80)
      return AREA_RANGE_TYPES[6]
    elsif (area>80 && area<=85)
      return AREA_RANGE_TYPES[7]
    elsif (area>85 && area<=90)
      return AREA_RANGE_TYPES[8]
    elsif (area>90 && area<=95)
      return AREA_RANGE_TYPES[9]
    elsif (area>95 && area<=100)
      return AREA_RANGE_TYPES[10]
    elsif (area>100 && area<=105)
      return AREA_RANGE_TYPES[11]
    elsif (area>105 && area<=110)
      return AREA_RANGE_TYPES[12]
    elsif (area>110 && area<=115)
      return AREA_RANGE_TYPES[13]
    elsif (area>115 && area<=120)
      return AREA_RANGE_TYPES[14]
    elsif (area>120 && area<=125)
      return AREA_RANGE_TYPES[15]
    elsif (area>125 && area<=130)
      return AREA_RANGE_TYPES[16]
    elsif (area>130 && area<=135)
      return AREA_RANGE_TYPES[17]
    elsif (area>135 && area<=140)
      return AREA_RANGE_TYPES[18]
    elsif (area>140 && area<=145)
      return AREA_RANGE_TYPES[19]
    elsif (area>145 && area<=150)
      return AREA_RANGE_TYPES[20]
    else
      return 'NOT DEFINED'
    end
  end
end
