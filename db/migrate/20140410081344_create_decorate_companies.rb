class CreateDecorateCompanies < ActiveRecord::Migration
  def change
    create_table :decorate_companies do |t|
      t.string :name
      t.text :brief
      t.date :created_date
      t.string :logo_path


      t.references :user

      t.timestamps
    end
  end
end
