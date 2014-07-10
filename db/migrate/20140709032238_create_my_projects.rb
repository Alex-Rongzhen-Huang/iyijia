class CreateMyProjects < ActiveRecord::Migration
  def change
    create_table :my_projects do |t|
      t.string :name
      t.references :order

      t.timestamps
    end
  end
end
