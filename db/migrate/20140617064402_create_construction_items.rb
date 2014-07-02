class CreateConstructionItems < ActiveRecord::Migration
  def change
    create_table :construction_items do |t|
      t.string :name
      t.string :type_of_work
      t.string :process_description
      t.string :unit

      t.timestamps
    end
  end
end
