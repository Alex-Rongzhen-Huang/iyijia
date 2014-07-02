class CreateMainMaterials < ActiveRecord::Migration
  def change
    create_table :main_materials do |t|
      t.string :name
      t.string :picture
      t.string :type
      t.float :price
      t.string :type_of_work

      t.references :main_material_brand
      t.references :decorate_company
      t.timestamps
    end
  end
end
