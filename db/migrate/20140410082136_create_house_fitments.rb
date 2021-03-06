class CreateHouseFitments < ActiveRecord::Migration
  def change
    create_table :house_fitments do |t|
      t.string :contact
      t.string :phone
      t.string :email
      t.string :address
      t.string :budget
      t.string :house_type
      t.text :notes
      t.references :user
      t.references :show_house

      t.timestamps
    end
  end
end
