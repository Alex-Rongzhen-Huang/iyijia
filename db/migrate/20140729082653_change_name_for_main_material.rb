class ChangeNameForMainMaterial < ActiveRecord::Migration
  def up
    remove_column :main_materials, :name
    add_column :main_materials, :main_material_name_id, :integer
  end

  def down
    remove_column :main_materials, :main_material_name_id
    add_column :main_materials, :name, :string
  end
end
