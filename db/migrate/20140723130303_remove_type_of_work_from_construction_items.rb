class RemoveTypeOfWorkFromConstructionItems < ActiveRecord::Migration
  def up
    remove_column :construction_items, :type_of_work
    add_column :construction_items, :type_of_work_id, :integer
  end

  def down
    add_column :construction_items, :type_of_work, :string
    remove_column :construction_items, :type_of_work_id
  end
end
