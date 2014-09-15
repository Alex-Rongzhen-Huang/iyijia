class AddCategoryToMainMaterial < ActiveRecord::Migration
  def up
    add_column :main_materials, :main_material_name_sub_category_id, :integer
  end

  def down
    remove_column :main_materials, :main_material_name_sub_category_id
  end
end
