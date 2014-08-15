# encoding: UTF-8
class CreatePackagePrices < ActiveRecord::Migration
  def change
    create_table :package_prices do |t|
      t.integer :rooms, :default => 1
      t.integer :doors, :default => 3
      t.integer :bathrooms, :default => 1
      t.integer :max_usable_area, :default => 40
      t.integer :kitchen_area, :default => 5
      t.integer :bathroom_area, :default => 5
      t.string :covered_area_range, :default => "S≤50"
      t.float :economy_price
      t.float :comfort_price
      t.float :luxury_price

      t.timestamps
    end
  end
end
