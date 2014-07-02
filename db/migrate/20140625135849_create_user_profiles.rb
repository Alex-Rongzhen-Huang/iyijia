class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :avatar
      t.string :nickname
      t.string :gender
      t.string :location
      t.string :mobile
      t.references :user
    end
    add_index :user_profiles, :user_id
  end
end
