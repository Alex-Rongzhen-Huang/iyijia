class CreateDecorateSchemeItems < ActiveRecord::Migration
  def change
    create_table :decorate_scheme_items do |t|
      t.string :path
      t.string :description
      t.references :decorate_scheme

      t.timestamps
    end
    add_index :decorate_scheme_items, :decorate_scheme_id
  end
end
