class CreateDecorateSchemes < ActiveRecord::Migration
  def change
    create_table :decorate_schemes do |t|
      t.string :name
      t.references :order

      t.timestamps
    end
  end
end
