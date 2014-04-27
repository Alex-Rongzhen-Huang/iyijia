class CreateHouseFitments < ActiveRecord::Migration
  def change
    create_table :house_fitments do |t|
      t.string :contact
      t.string :phone
      t.string :email
      t.string :address
      t.text :notes

      t.timestamps
    end
  end
end
