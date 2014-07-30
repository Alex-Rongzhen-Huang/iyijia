class ChangeTypeForMainMaterials < ActiveRecord::Migration
  def up
    remove_column :main_materials, :type
    add_column :main_materials, :specifications, :string
  end

  def down
    remove_column :main_materials, :specifications
    add_column :main_materials, :type, :string
  end
end
