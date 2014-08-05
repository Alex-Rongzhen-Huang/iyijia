# encoding: UTF-8
class CreateMainMaterialNames < ActiveRecord::Migration
  def change
    create_table :main_material_names do |t|
      t.string :name

      t.timestamps
    end
  end
  
  def migrate(direction)
    super
    # Create a default settings

    if direction == :up then
      MainMaterialName.create!(:name => '室内门')
      MainMaterialName.create!(:name => '地板')
      MainMaterialName.create!(:name => '瓷砖')
      MainMaterialName.create!(:name => '全屋踢脚线')
      MainMaterialName.create!(:name => '整体橱柜')
      MainMaterialName.create!(:name => '厨房水槽龙头')
      MainMaterialName.create!(:name => '卫浴洁具柜组合')
      MainMaterialName.create!(:name => '卫浴五金')
      MainMaterialName.create!(:name => '集成吊顶')
    end
  end
  
end
