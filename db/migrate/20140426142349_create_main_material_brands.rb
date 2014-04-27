class CreateMainMaterialBrands < ActiveRecord::Migration
  def change
    create_table :main_material_brands do |t|
      t.string :name
      t.string :logo_path
    end

    create_table :show_house_main_material_brands do |t|
      t.belongs_to :main_material_brand
      t.belongs_to :show_house
      t.timestamps
    end
  end
end
