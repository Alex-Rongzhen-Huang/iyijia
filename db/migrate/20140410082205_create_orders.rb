class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.references :user
      t.references :decorate_company
      t.references :show_house
      t.references :house_fitment
      t.string :measure_status
      t.string :quotation_status
      t.string :quotation_link

      t.timestamps
    end
  end
end
