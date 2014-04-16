class CreateDecorateCompanies < ActiveRecord::Migration
  def change
    create_table :decorate_companies do |t|
      t.string :name
      t.text :brief

      t.references :admin_user

      t.timestamps
    end
  end
end
