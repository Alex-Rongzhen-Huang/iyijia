# encoding: UTF-8
class CreateInitDataOfPackagePrices < ActiveRecord::Migration
  def up
    PackagePrice.create!(:rooms => 1, :doors => 3, :max_usable_area => 40, :kitchen_area => 5, :bathroom_area => 5, :covered_area_range => "S≤50", :bathrooms => 1, :construction_price => 38800)
    PackagePrice.create!(:rooms => 1, :doors => 3, :max_usable_area => 44, :kitchen_area => 5, :bathroom_area => 5, :covered_area_range => "50＜S≤55", :bathrooms => 1, :construction_price => 39300)
    PackagePrice.create!(:rooms => 1, :doors => 3, :max_usable_area => 48, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "55＜S≤60", :bathrooms => 1, :construction_price => 41100)
    PackagePrice.create!(:rooms => 2, :doors => 4, :max_usable_area => 52, :kitchen_area => 5, :bathroom_area => 5, :covered_area_range => "60＜S≤65", :bathrooms => 1, :construction_price => 42200)
    PackagePrice.create!(:rooms => 2, :doors => 4, :max_usable_area => 56, :kitchen_area => 5, :bathroom_area => 5, :covered_area_range => "65＜S≤70", :bathrooms => 1, :construction_price => 46100)
    PackagePrice.create!(:rooms => 2, :doors => 4, :max_usable_area => 60, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "70＜S≤75", :bathrooms => 1, :construction_price => 48100)
    PackagePrice.create!(:rooms => 2, :doors => 4, :max_usable_area => 64, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "75＜S≤80", :bathrooms => 1, :construction_price => 49600)
    PackagePrice.create!(:rooms => 3, :doors => 5, :max_usable_area => 68, :kitchen_area => 5, :bathroom_area => 5, :covered_area_range => "80＜S≤85", :bathrooms => 1, :construction_price => 52900)
    PackagePrice.create!(:rooms => 3, :doors => 5, :max_usable_area => 72, :kitchen_area => 5, :bathroom_area => 5, :covered_area_range => "85＜S≤90", :bathrooms => 1, :construction_price => 55800)
    PackagePrice.create!(:rooms => 3, :doors => 5, :max_usable_area => 76, :kitchen_area => 5, :bathroom_area => 5, :covered_area_range => "90＜S≤95", :bathrooms => 1, :construction_price => 59300)
    PackagePrice.create!(:rooms => 3, :doors => 6, :max_usable_area => 76, :kitchen_area => 5, :bathroom_area => 5, :covered_area_range => "90＜S≤95", :bathrooms => 2, :construction_price => 63600)
    PackagePrice.create!(:rooms => 3, :doors => 5, :max_usable_area => 80, :kitchen_area => 5, :bathroom_area => 5, :covered_area_range => "95＜S≤100", :bathrooms => 1, :construction_price => 61400)
    PackagePrice.create!(:rooms => 3, :doors => 6, :max_usable_area => 80, :kitchen_area => 5, :bathroom_area => 5, :covered_area_range => "95＜S≤100", :bathrooms => 2, :construction_price => 65500)
    PackagePrice.create!(:rooms => 3, :doors => 5, :max_usable_area => 84, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "100＜S≤105", :bathrooms => 1, :construction_price => 63000)
    PackagePrice.create!(:rooms => 3, :doors => 6, :max_usable_area => 84, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "100＜S≤105", :bathrooms => 2, :construction_price => 67000)
    PackagePrice.create!(:rooms => 3, :doors => 5, :max_usable_area => 88, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "105＜S≤110", :bathrooms => 1, :construction_price => 64600)
    PackagePrice.create!(:rooms => 3, :doors => 6, :max_usable_area => 88, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "105＜S≤110", :bathrooms => 2, :construction_price => 70200)
    PackagePrice.create!(:rooms => 3, :doors => 5, :max_usable_area => 92, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "110＜S≤115", :bathrooms => 1, :construction_price => 68200)
    PackagePrice.create!(:rooms => 3, :doors => 6, :max_usable_area => 92, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "110＜S≤115", :bathrooms => 2, :construction_price => 73700)
    PackagePrice.create!(:rooms => 3, :doors => 5, :max_usable_area => 96, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "115＜S≤120", :bathrooms => 1, :construction_price => 71200)
    PackagePrice.create!(:rooms => 3, :doors => 6, :max_usable_area => 96, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "115＜S≤120", :bathrooms => 2, :construction_price => 75000)
    PackagePrice.create!(:rooms => 3, :doors => 5, :max_usable_area => 100, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "120＜S≤125", :bathrooms => 1, :construction_price => 74300)
    PackagePrice.create!(:rooms => 3, :doors => 6, :max_usable_area => 100, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "120＜S≤125", :bathrooms => 2, :construction_price => 78100)
    PackagePrice.create!(:rooms => 3, :doors => 5, :max_usable_area => 104, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "125＜S≤130", :bathrooms => 1, :construction_price => 76400)
    PackagePrice.create!(:rooms => 3, :doors => 6, :max_usable_area => 104, :kitchen_area => 6, :bathroom_area => 5, :covered_area_range => "125＜S≤130", :bathrooms => 2, :construction_price => 80200)
    PackagePrice.create!(:rooms => 3, :doors => 5, :max_usable_area => 108, :kitchen_area => 6, :bathroom_area => 6, :covered_area_range => "130＜S≤135", :bathrooms => 1, :construction_price => 79300)
    PackagePrice.create!(:rooms => 3, :doors => 6, :max_usable_area => 108, :kitchen_area => 6, :bathroom_area => 6, :covered_area_range => "130＜S≤135", :bathrooms => 2, :construction_price => 84300)
    PackagePrice.create!(:rooms => 3, :doors => 5, :max_usable_area => 112, :kitchen_area => 6, :bathroom_area => 6, :covered_area_range => "135＜S≤140", :bathrooms => 1, :construction_price => 80800)
    PackagePrice.create!(:rooms => 3, :doors => 6, :max_usable_area => 112, :kitchen_area => 6, :bathroom_area => 6, :covered_area_range => "135＜S≤140", :bathrooms => 2, :construction_price => 87500)
    PackagePrice.create!(:rooms => 4, :doors => 6, :max_usable_area => 116, :kitchen_area => 6, :bathroom_area => 6, :covered_area_range => "140＜S≤145", :bathrooms => 1, :construction_price => 82400)
    PackagePrice.create!(:rooms => 4, :doors => 7, :max_usable_area => 116, :kitchen_area => 6, :bathroom_area => 6, :covered_area_range => "140＜S≤145", :bathrooms => 2, :construction_price => 89300)
    PackagePrice.create!(:rooms => 4, :doors => 6, :max_usable_area => 120, :kitchen_area => 6, :bathroom_area => 6, :covered_area_range => "145＜S≤150", :bathrooms => 1, :construction_price => 84100)
    PackagePrice.create!(:rooms => 4, :doors => 7, :max_usable_area => 120, :kitchen_area => 6, :bathroom_area => 6, :covered_area_range => "145＜S≤150", :bathrooms => 2, :construction_price => 91100)

  end

  def down
    PackagePrice.all().each do |x|
      x.destroy
    end
  end
end
