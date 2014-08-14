# encoding: UTF-8
class PackagePrice < ActiveRecord::Base
  attr_accessible :rooms, :bathrooms, :doors, :kitchen_area, :bathroom_area, :comfort_price, :covered_area_range, :economy_price, :luxury_price, :max_usable_area

  def calculate_economy_price
    price_of_door = get_main_material_price('室内门').economy
    price_of_floor = get_main_material_price('地板').economy
    price_of_ceramic_tile= get_main_material_price('瓷砖').economy
    price_of_skirting_line= get_main_material_price('全屋踢脚线').economy
    price_of_cabinet= get_main_material_price('整体橱柜').economy
    price_of_kitchen_sink= get_main_material_price('厨房水槽龙头').economy
    price_of_bathroom_cabinet= get_main_material_price('卫浴洁具柜组合').economy
    price_of_bathroom_hardware= get_main_material_price('卫浴五金').economy
    price_of_integrated_ceiling = get_main_material_price('集成吊顶').economy

    # 室内门单价×室内门数
    price_of_door*doors
    # 地板和地砖单价平均数×最大面积
    ((price_of_floor+price_of_ceramic_tile)/2.0)*max_usable_area
    # 厨房墙砖面积×瓷砖单价  (3.5*2.3*(SQRT(D12))*Sheet2!$E$4    )
    3.5*2.5*Math.sqrt(kitchen_area)*price_of_ceramic_tile
    #卫生间墙砖面积×瓷砖单价（两卫×2） 3.5*2.3*(SQRT(E12))*Sheet2!$E$4*2
    3.5*2.5*Math.sqrt(bathroom_area)*price_of_ceramic_tile*bathrooms
    # 橱柜单价×厨房延米（房屋最大面积的5%）(Sheet2!$E$6*C12*0.05)
    max_usable_area*0.05*price_of_cabinet
    # 厨房水槽龙头组合
    price_of_kitchen_sink
    # 卫浴洁具柜组合（两卫×2）
    price_of_bathroom_cabinet*bathrooms
    # 卫浴五金组合（两卫×2）
    price_of_bathroom_hardware*bathrooms
    # 集成吊顶单价×厨房面积
    price_of_integrated_ceiling*kitchen_area
    # 集成吊顶单价×卫生间面积
    price_of_integrated_ceiling*bathroom_area
    # 门套线踢脚线
    300*3
    # 浴霸单价（两卫×2）, TODO: FIXME
    400 * bathrooms





  end

  def get_main_material_price(name)
    MainMaterialPrice.find_by_main_material_name_id(MainMaterialName.find_by_name(name).id)
  end
end
