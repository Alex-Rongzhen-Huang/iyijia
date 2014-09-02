class CreateHomeBrandSettings < ActiveRecord::Migration
  def change
    create_table :home_brand_settings do |t|
      t.string :path
      t.string :package_type

      t.timestamps
    end
  end
end
