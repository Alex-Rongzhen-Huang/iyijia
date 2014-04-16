class CreateColorSurfaces < ActiveRecord::Migration
  def change
    create_table :color_surfaces do |t|
      t.string :title
      t.string :picture

      t.references :decorate_company

      t.timestamps
    end
  end
end
