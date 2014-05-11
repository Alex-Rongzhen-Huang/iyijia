class CreateColorSurfaces < ActiveRecord::Migration
  def change
    create_table :color_surfaces do |t|
      t.string :title
      t.string :picture
      t.string :picture2
      t.string :picture3
      t.string :picture4
      t.string :picture5

      t.references :decorate_company

      t.timestamps
    end
  end
end
