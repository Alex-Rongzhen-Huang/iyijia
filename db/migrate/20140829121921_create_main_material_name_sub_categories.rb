class CreateMainMaterialNameSubCategories < ActiveRecord::Migration
  def change
    create_table :main_material_name_sub_categories do |t|
      t.string :name
      t.references :main_material_name

      t.timestamps
    end
    add_index :main_material_name_sub_categories, :main_material_name_id
  end
end
