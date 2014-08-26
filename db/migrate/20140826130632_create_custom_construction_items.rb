class CreateCustomConstructionItems < ActiveRecord::Migration
  def change
    create_table :custom_construction_items do |t|
      t.references :order_quotation
      t.references :construction_item
      t.string :description
      t.float :price
      t.integer :count

      t.timestamps
    end
    add_index :custom_construction_items, :order_quotation_id
    add_index :custom_construction_items, :construction_item_id
  end
end
