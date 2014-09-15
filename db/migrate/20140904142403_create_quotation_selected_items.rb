class CreateQuotationSelectedItems < ActiveRecord::Migration
  def change
    create_table :quotation_selected_items do |t|
      t.references :order_quotation
      t.references :main_material_name
      t.references :main_material_name_sub_category
      t.references :main_material
      t.boolean :upgrade
      t.float :delta_price

      t.timestamps
    end
    add_index :quotation_selected_items, :main_material_name_id,{:name=>'by_name_id'}
    add_index :quotation_selected_items, :main_material_name_sub_category_id, {:name=>'by_sub_category_id'}
    add_index :quotation_selected_items, :main_material_id, {:name=>'by_main_material_id'}
    add_index :quotation_selected_items, :order_quotation_id, {:name=>'by_order_quotation_id'}
  end
end
