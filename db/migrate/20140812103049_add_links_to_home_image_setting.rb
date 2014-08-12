class AddLinksToHomeImageSetting < ActiveRecord::Migration
  def change
    add_column :home_image_settings, :link1, :string
    add_column :home_image_settings, :link2, :string
    add_column :home_image_settings, :link3, :string
    add_column :home_image_settings, :link4, :string
    add_column :home_image_settings, :link5, :string
  end
end
