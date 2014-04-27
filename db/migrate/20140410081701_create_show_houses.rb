class CreateShowHouses < ActiveRecord::Migration
  def change
    create_table :show_houses do |t|
      t.string :title
      t.string :area
      t.string :house_type
      t.text :brief
      t.text :overview
      t.string :style
      t.string :concept
      t.string :usage
      t.integer :price
      t.text :need_to_know

      t.references :decorate_company

      t.timestamps
    end
  end
end
