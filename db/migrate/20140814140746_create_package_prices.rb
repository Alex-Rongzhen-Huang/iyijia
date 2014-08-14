class CreatePackagePrices < ActiveRecord::Migration
  def change
    create_table :package_prices do |t|
      t.integer :rooms
      t.integer :doors
      t.integer :bathrooms
      t.integer :max_usable_area
      t.integer :kitchen_area
      t.integer :bathroom_area
      t.string :covered_area_range
      t.float :economy_price
      t.float :comfort_price
      t.float :luxury_price

      t.timestamps
    end
  end
end
