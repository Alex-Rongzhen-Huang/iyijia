class CreateMyProjectItems < ActiveRecord::Migration
  def change
    create_table :my_project_items do |t|
      t.string :path
      t.string :description
      t.references :my_project

      t.timestamps
    end
    add_index :my_project_items, :my_project_id
  end
end
