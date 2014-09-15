class AddMainMaterialNameForMainMaterialBrands < ActiveRecord::Migration
  def up
    add_column :main_material_brands, :main_material_name_id, :integer
  end

  def down
    remove_column :main_material_brands, :main_material_name_id
  end
end
