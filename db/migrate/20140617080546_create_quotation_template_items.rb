class CreateQuotationTemplateItems < ActiveRecord::Migration
  def change
    create_table :quotation_template_items do |t|
      t.references :quotation_template
      t.references :construction_item
      t.references :main_material
      t.integer :construction_item_number
      t.string :category
      t.float :main_material_total_price
      t.string :supplementary_material_type
      t.float :supplementary_material_price
      t.float :supplementary_material_total_price
      t.float :labour_cost
      t.float :labour_cost_total
      t.float :total_price
      t.string :note
    end
    add_index :quotation_template_items, :quotation_template_id
    add_index :quotation_template_items, :construction_item_id
    add_index :quotation_template_items, :main_material_id
  end
end
