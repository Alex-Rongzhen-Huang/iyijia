class CreateHouseFitments < ActiveRecord::Migration
  def change
    create_table :house_fitments do |t|
      t.string :contact
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
