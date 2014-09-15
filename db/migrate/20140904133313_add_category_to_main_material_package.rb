class AddCategoryToMainMaterialPackage < ActiveRecord::Migration
  def up
    add_column :main_material_packages, :main_material_name_sub_category_id, :integer
  end

  def down
    remove_column :main_material_packages, :main_material_name_sub_category_id
  end
end
