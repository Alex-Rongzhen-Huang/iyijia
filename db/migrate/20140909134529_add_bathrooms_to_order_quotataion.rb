class AddBathroomsToOrderQuotation < ActiveRecord::Migration
  def up
    add_column :order_quotations, :bathrooms, :integer
    add_column :order_quotations, :calculated_price, :float
  end

  def down
    remove_column :order_quotations, :bathrooms
    remove_column :order_quotations, :calculated_price
  end
end
