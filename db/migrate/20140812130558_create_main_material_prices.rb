# encoding: UTF-8
class CreateMainMaterialPrices < ActiveRecord::Migration
  def up
    create_table :main_material_prices do |t|
      t.references :main_material_name
      t.float :economy
      t.float :economy_cost
      t.float :comfort
      t.float :comfort_cost
      t.float :luxury
      t.float :luxury_cost

      t.timestamps
    end
    add_index :main_material_prices, :main_material_name_id

    MainMaterialPrice.create!(:main_material_name_id => MainMaterialName.find_by_name('室内门').id, :economy_cost => 600, :comfort_cost => 800, :luxury_cost => 0, :economy => 900, :comfort => 1200, :luxury => 0)
    MainMaterialPrice.create!(:main_material_name_id => MainMaterialName.find_by_name('地板').id, :economy_cost => 60, :comfort_cost => 110, :luxury_cost => 0, :economy => 90, :comfort => 180, :luxury => 0)
    MainMaterialPrice.create!(:main_material_name_id => MainMaterialName.find_by_name('瓷砖').id, :economy_cost => 60, :comfort_cost => 100, :luxury_cost => 0, :economy => 90, :comfort => 142, :luxury => 0)
    MainMaterialPrice.create!(:main_material_name_id => MainMaterialName.find_by_name('全屋踢脚线').id, :economy_cost => 10, :comfort_cost => 25, :luxury_cost => 0, :economy => 15, :comfort => 35, :luxury => 0)
    MainMaterialPrice.create!(:main_material_name_id => MainMaterialName.find_by_name('整体橱柜').id, :economy_cost => 900, :comfort_cost => 1200, :luxury_cost => 0, :economy => 1200, :comfort => 1900, :luxury => 0)
    MainMaterialPrice.create!(:main_material_name_id => MainMaterialName.find_by_name('厨房水槽龙头').id, :economy_cost => 450, :comfort_cost => 800, :luxury_cost => 0, :economy => 600, :comfort => 1000, :luxury => 0)
    MainMaterialPrice.create!(:main_material_name_id => MainMaterialName.find_by_name('卫浴洁具柜组合').id, :economy_cost => 2500, :comfort_cost => 6000, :luxury_cost => 0, :economy => 3000, :comfort => 7000, :luxury => 0)
    MainMaterialPrice.create!(:main_material_name_id => MainMaterialName.find_by_name('卫浴五金').id, :economy_cost => 400, :comfort_cost => 400, :luxury_cost => 0, :economy => 500, :comfort => 500, :luxury => 0)
    MainMaterialPrice.create!(:main_material_name_id => MainMaterialName.find_by_name('集成吊顶').id, :economy_cost => 110, :comfort_cost => 110, :luxury_cost => 0, :economy => 150, :comfort => 150, :luxury => 0)

  end
  def down
    remove_index  :main_material_prices, :main_material_name_id
    drop_table  :main_material_prices
  end
end
