class CreateOrderQuotations < ActiveRecord::Migration
  def change
    create_table :order_quotations do |t|
      t.references :order
      t.string :main_material_package_type
      t.integer :confirmed_area
      t.string :constructor
      t.string :constructor_contact

      t.timestamps
    end
    add_index :order_quotations, :order_id
  end
end
