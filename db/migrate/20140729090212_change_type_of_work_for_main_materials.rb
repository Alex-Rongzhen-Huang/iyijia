class ChangeTypeOfWorkForMainMaterials < ActiveRecord::Migration
  def up
    remove_column :main_materials, :type_of_work
    add_column :main_materials, :type_of_work_id, :integer
  end

  def down
    remove_column :main_materials, :type_of_work_id
    add_column :main_materials, :type_of_work, :string
  end
end
