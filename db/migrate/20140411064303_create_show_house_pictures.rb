class CreateShowHousePictures < ActiveRecord::Migration
  def change
    create_table :show_house_pictures do |t|
      t.string :path
      t.string :brief
      #t.text :description
      t.references :show_house

      t.timestamps
    end
  end
end
