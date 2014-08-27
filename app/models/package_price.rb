# encoding: UTF-8
class PackagePrice < ActiveRecord::Base
  attr_accessible :rooms, :bathrooms, :doors, :kitchen_area, :bathroom_area, :comfort_price, :covered_area_range, :economy_price, :luxury_price, :max_usable_area, :construction_price
  # currently 2 column validate is OK, might need another field later which is also ok by setting :scope=>[:field1, :field2]
  validates :covered_area_range, :presence => true, :uniqueness => {:scope => :bathrooms, :message => 'Should be unique per bathroom type'}
  before_save :calculate
  validates :rooms, :bathrooms, :doors, :kitchen_area, :bathroom_area, :construction_price, :presence => true

  AREA_RANGE_TYPES = %w[S≤50 50＜S≤55 55＜S≤60 60＜S≤65 65＜S≤70 70＜S≤75 75＜S≤80 80＜S≤85 85＜S≤90 90＜S≤95 95＜S≤100 100＜S≤105  105＜S≤110  110＜S≤115  115＜S≤120  120＜S≤125  125＜S≤130  130＜S≤135  135＜S≤140  140＜S≤145  145＜S≤150]
  ROOM_TYPES = %w[1 2 3 4 5 6 7 8 9]
  BATHROOM_TYPES = %w[1 2]
  protected
  def calculate
    calculate_comfort_price
    calculate_economy_price
    calculate_luxury_price
  end

  def calculate_economy_price
    price_of_door = get_main_material_price('室内门').economy
    price_of_floor = get_main_material_price('地板').economy
    price_of_ceramic_tile= get_main_material_price('瓷砖').economy
    price_of_skirting_line= get_main_material_price('全屋踢脚线').economy
    price_of_cabinet= get_main_material_price('整体橱柜').economy
    price_of_kitchen_sink= get_main_material_price('厨房水槽（带龙头组合）').economy
    price_of_bathroom_cabinet= get_main_material_price('卫浴洁具（坐便器、台盆及柜体）').economy
    #TODO:
    price_of_bathroom_hardware= get_main_material_price('卫浴五金').economy
    price_of_integrated_ceiling = get_main_material_price('集成吊顶').economy

    price = sum(price_of_door, price_of_floor, price_of_ceramic_tile,
                price_of_skirting_line, price_of_cabinet, price_of_kitchen_sink,
                price_of_bathroom_cabinet, price_of_bathroom_hardware, price_of_integrated_ceiling)
    price+= 400 # 浴霸
    self.economy_price= price.round
  end

  def calculate_comfort_price
    price_of_door = get_main_material_price('室内门').comfort
    price_of_floor = get_main_material_price('地板').comfort
    price_of_ceramic_tile= get_main_material_price('瓷砖').comfort
    price_of_skirting_line= get_main_material_price('全屋踢脚线').comfort
    price_of_cabinet= get_main_material_price('整体橱柜').comfort
    price_of_kitchen_sink= get_main_material_price('厨房水槽（带龙头组合）').comfort
    price_of_bathroom_cabinet= get_main_material_price('卫浴洁具（坐便器、台盆及柜体）').comfort
    price_of_bathroom_hardware= get_main_material_price('卫浴五金').comfort
    price_of_integrated_ceiling = get_main_material_price('集成吊顶').comfort

    price = sum(price_of_door, price_of_floor, price_of_ceramic_tile,
                price_of_skirting_line, price_of_cabinet, price_of_kitchen_sink,
                price_of_bathroom_cabinet, price_of_bathroom_hardware, price_of_integrated_ceiling)
    price+= 1200 # 浴霸
    self.comfort_price= price.round
  end

  def calculate_luxury_price
    price_of_door = get_main_material_price('室内门').luxury
    price_of_floor = get_main_material_price('地板').luxury
    price_of_ceramic_tile= get_main_material_price('瓷砖').luxury
    price_of_skirting_line= get_main_material_price('全屋踢脚线').luxury
    price_of_cabinet= get_main_material_price('整体橱柜').luxury
    price_of_kitchen_sink= get_main_material_price('厨房水槽（带龙头组合）').luxury
    price_of_bathroom_cabinet= get_main_material_price('卫浴洁具（坐便器、台盆及柜体）').luxury
    price_of_bathroom_hardware= get_main_material_price('卫浴五金').luxury
    price_of_integrated_ceiling = get_main_material_price('集成吊顶').luxury

    price = sum(price_of_door, price_of_floor, price_of_ceramic_tile,
                price_of_skirting_line, price_of_cabinet, price_of_kitchen_sink,
                price_of_bathroom_cabinet, price_of_bathroom_hardware, price_of_integrated_ceiling)

    price+= 1200 # 浴霸 TODO:
    self.luxury_price= price.round
  end

  def get_main_material_price(name)
    MainMaterialPrice.find_by_main_material_name_id(MainMaterialName.find_by_name(name).id)
  end

  def sum(price_of_door, price_of_floor, price_of_ceramic_tile,
      price_of_skirting_line, price_of_cabinet, price_of_kitchen_sink,
      price_of_bathroom_cabinet, price_of_bathroom_hardware, price_of_integrated_ceiling)
    # 室内门单价×室内门数
    p1 = price_of_door*doors
    # 地板和地砖单价平均数×最大面积
    p21 = ((price_of_floor+price_of_ceramic_tile)/2.0)*max_usable_area
    # 厨房墙砖面积×瓷砖单价  (3.5*2.3*(SQRT(D12))*Sheet2!$E$4    )
    p22 = 3.5*2.5*Math.sqrt(kitchen_area)*price_of_ceramic_tile
    #卫生间墙砖面积×瓷砖单价（两卫×2） 3.5*2.3*(SQRT(E12))*Sheet2!$E$4*2
    p3 = 3.5*2.5*Math.sqrt(bathroom_area)*price_of_ceramic_tile*bathrooms
    # 橱柜单价×厨房延米（房屋最大面积的5%）(Sheet2!$E$6*C12*0.05)
    p4 = max_usable_area*0.05*price_of_cabinet
    # 厨房水槽龙头组合
    p5 = price_of_kitchen_sink
    # 卫浴洁具（坐便器、台盆及柜体）（两卫×2）
    p6 = price_of_bathroom_cabinet*bathrooms
    #TODO
    # 卫浴五金组合（两卫×2）
    p7 = price_of_bathroom_hardware*bathrooms
    # 集成吊顶单价×厨房面积
    p81 = price_of_integrated_ceiling*kitchen_area
    # 集成吊顶单价×卫生间面积 ，这里的浴霸价格包含在内，可能导致不够精确
    p82 = price_of_integrated_ceiling*bathroom_area
    # 门套线踢脚线, TODO: correct?
    p9 = 300*3
    # 浴霸 单独hard code

    return (p1+p21+p22+p3+p4+p5+p6+p7+p81+p82+p9)

  end
end
