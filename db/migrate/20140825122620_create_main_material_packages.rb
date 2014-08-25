class CreateMainMaterialPackages < ActiveRecord::Migration
  def change
    create_table :main_material_packages do |t|
      t.string :name
      t.references :main_material_name
      t.references :main_material

      t.timestamps
    end
    add_index :main_material_packages, :main_material_name_id
    add_index :main_material_packages, :main_material_id
  end
end
