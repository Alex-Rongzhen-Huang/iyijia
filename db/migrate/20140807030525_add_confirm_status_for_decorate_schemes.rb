class AddConfirmStatusForDecorateSchemes < ActiveRecord::Migration
  def up
    add_column :decorate_schemes, :confirm_status, :string
  end

  def down
    remove_column :decorate_schemes, :confirm_status
  end
end
