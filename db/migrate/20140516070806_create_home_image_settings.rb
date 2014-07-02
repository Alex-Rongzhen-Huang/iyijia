class CreateHomeImageSettings < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default settings

    if direction == :up then
      execute <<-SQL
        insert into home_image_settings(img1,img2,img3,img4,img5)
        values( 'slider-image1.jpg',
                'slider-image2.jpg',
                'slider-image3.jpg',
                'slider-image4.jpg',
                'slider-image5.jpg')
      SQL
    end

  end

  def change
    create_table :home_image_settings do |t|
      t.string :img1
      t.string :img2
      t.string :img3
      t.string :img4
      t.string :img5
    end
  end
end
