class CreateMainMaterials < ActiveRecord::Migration
  def change
    create_table :main_materials do |t|
      t.string :name
      t.string :picture
      t.string :type
      t.float :price
      t.string :package_type
      t.string :description
      t.string :specifications

      t.references :main_material_name
      t.references :main_material_brand
      t.references :decorate_company
      t.references :type_of_work
      t.timestamps
    end
  end
end
